echo 从废弃ip库中获取历史ip
function getIpBySpeed() {
    echo 根据speed字段将ip重新添加到ip.txt中
    for ((i = 1; i < line; i++)); do
    line_num=$i
    echo $line_num
    line_str=$(sed -n "$line_num,${line_num}p" depleted-ip.txt) #当前行文本
    echo "$line_str"
    speed=$(echo "$line_str" | awk '{print $3}' | awk -F ':' '{print $1}') #3.28
    # echo awk -v num1=3.8 -v num2=5 'BEGIN{print(num1>num2)?"0":"1"}'
    if [ "$(awk -v num1="$speed" -v num2="$1" 'BEGIN{print(num1>num2)?"0":"1"}')" -eq 0 ]; then
      #speed 值大于目标值，插入ip
      echo "insert $(echo "$line_str" | awk '{print $1}')" #47.243.230.93:2053#HK-14
      insert_txt=$(echo "$line_str" | awk '{print $1}')
      sed -i "1i $insert_txt " ip.txt
      sed -i "$line_num,${line_num}d" depleted-ip.txt #重新插入后删除废弃库的ip
      ((i--))
      echo $i
    fi
  done

}
function getIpByCloudST() {
    echo 将ip通过cloudspeedST 测试后,重新添加到ip.txt
    #先直接根据返回ip，减少测速的ip
  line=$(awk 'END{print NR}' depleted-ip.txt)
  echo "line:$line"
  speed_sv=$1
  for ((i = 1; i <= line; i++)); do
    echo "${i}"
    i=89
    ip_str=$(sed -n "$i,${i}p" depleted-ip.txt | awk '{print $1}') #表达式不能单引号中展开 https://www.shellcheck.net/wiki/SC2016
    echo "$ip_str"
    if [ -z "$(sed -n "${i},${i}p" depleted-ip.txt)" ]; then
                                                            echo "ip库该行为空,任务执行结束"
                                                    # exit 1 #这里直接exit退出程序了。应该是退出循环
                                                    break
    fi
    address=$(echo "$ip_str" | awk -F '#' '{print $1}' | awk -F ':' '{print $1}')
    port=$(echo "$ip_str"  | awk -F '#' '{print $1}' | awk -F ':' '{print $2}')
    echo "$address : $port"
    rm res.csv
    echo . | ./../CloudflareST -tp "$port" -n 1000 -dn 1 -p 1 -tl 300 -sl "$speed_sv" -t 4  -tlr 0.3 -url https://www.learnwebs.top/file/movie_max.mp4 -ip "$address" -o ./res.csv

     #测速跑完之后，查看res.csv文件是否存在，若不在或者 下载速度小于 3删除，则删除该ip
    if [ ! -e "res.csv" ]; then
                              echo "no exits res.csv"
    fi
    if [ -e "res.csv" ]; then
                              speed=$(sed -n "2,2p" "res.csv" | awk -F ',' '{print $6}') #{}里面只能使用''
                              echo "$address 测速: $speed"
      # if [ "$speed" -le 3 ]; then
      if [[ $(awk -v num1="$speed" -v num2="$speed_sv" 'BEGIN{print(num1>num2)?"0":"1"}') -eq 0 ]]; then
        echo "insert ""$address"
        # sed -n "${item},${item}d" ip.txt &>> depleted-ip.txt
        # sed -n "${item},${item}d" ip.txt #使用-n 删除无效
        sed -i "1i ${ip_str}" ip.txt
        sed -i "${i},${i}d" depleted-ip.txt
        #这里还有一个问题，如果ip删除之后，ip.txt文档中的序号会发生改变，所以这里一旦删除，下一行ip会上移,这行ip就不会进入测试； 所以item需要减1
        i=$(($i - 1))
        echo insert $i
        # i=$item
      fi
    fi
  done

}

function get_args_by_getopt()  { #支持短选项和长选项
    # echo "$1" # arguments are accessible through $1, $2,...
    echo "$0$*"
    args=[$*]
}
function get_args_by_getopts()  { #仅支持短选项
    echo "$1" # arguments are accessible through $1, $2,...
}

str="cd \"C:/software/v2rayN/CloudflareST_windows_amd64/CF-WORKERS\""
eval "$str"
if [ ! -e "depleted-ip.txt" ]; then
                                   echo "无 depleted-ip.txt"
                                                              exit 1
fi
target=3
getIpBySpeed $target

getIpByCloudST $target
# exit 0

./git_push.sh
