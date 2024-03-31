echo #!/etc/bash
function test_speed() {
  echo "对之前优选ip库进行筛选测速，每天进行;对于不合格的ip直接进行删除或者放入废弃ip库（depleted-ip.txt）:$0"

  # str=$(echo pwd)
  str="cd \"C:/software/v2rayN/CloudflareST_windows_amd64/CF-WORKERS\""
  eval $str
  echo $(pwd)
  if [[ ! -e "ip.txt" ]]; then
                          echo "not exist ip.txt"
                                                  exit 1
  fi
  line=$(awk 'END{print NR}' ip.txt)
  speed_sv=$1
  url_file=$file
  echo url_file:"$url_file"
  echo "ip.txt文本行数:$line"
  # for item in $(seq $line); do
  for ((i = 1; i <= "${line}"; i++)); do
    #   echo "${i}"
    # done
    # i=$(($line + 1))  #用于测试当当前行为空行时，后续程序执行状况。
    item=${i}
    eval $str
    echo "${item}"
    if [ -e "res.csv" ]; then rm res.csv; fi
    if [ -z $(sed -n "${item},${item}p" ip.txt) ]; then
                                                            echo "ip库该行为空,任务执行结束"
                                                    # exit 1 #这里直接exit退出程序了。应该是退出循环
                                                    break
    fi
    address=$(sed -n "${item},${item}p" ip.txt | awk -F '#' '{print $1}' | awk -F ':' '{print $1}')
    port=$(sed -n "${item},${item}p" ip.txt | awk -F '#' '{print $1}' | awk -F ':' '{print $2}')
    echo "$address :$port"
    # if [ -z "$address" ]; then
    #                           echo "ip长度为0"
    #                                               exit 1
    # fi
    # echo . | ./../CloudflareST -tp "$port" -n 1000 -dn 1 -p 1 -tl 300 -sl "$speed_sv" -t 4  -tlr 0.3 -url https://www.learnwebs.top/file/movie_max.mp4 -ip "$address" -o ./res.csv
    echo . | ./../CloudflareST -tp "$port" -n 1000 -dn 1 -p 1 -tl 300 -sl "$speed_sv" -t 4  -tlr 0.3 -url $url_file -ip "$address" -o ./res.csv
    #测速跑完之后，查看res.csv文件是否存在，若不在或者 下载速度小于 3删除，则删除该ip
    if [ ! -e "res.csv" ]; then
                                sed -n "${item},${item}p" ip.txt &>> depleted-ip.txt
                              # item=$((${item} - 1))
                              echo "测速完 no res.csv 文件 ; delete:  $item"
                                                      i=$item
      sed -n "${item},${item}d" ip.txt
    fi
    if [ -e "res.csv" ]; then
                              speed=$(sed -n "2,2p" "res.csv" | awk -F ',' '{print $6}') #{}里面只能使用''
                              echo "$address 测速: $speed"
      # if [ "$speed" -le 3 ]; then
      if [[ $(awk -v num1="$speed" -v num2="$speed_sv" 'BEGIN{print(num1>num2)?"0":"1"}') -eq 1 ]]; then
        echo "delete "$address
        # sed -n "${item},${item}d" ip.txt &>> depleted-ip.txt
        # sed -n "${item},${item}d" ip.txt #使用-n 删除无效
        echo $(sed -n "${item},${item}p" ip.txt)"  speed:  $speed" &>> depleted-ip.txt
        sed -i "${item},${item}d" ip.txt
        #这里还有一个问题，如果ip删除之后，ip.txt文档中的序号会发生改变，所以这里一旦删除，下一行ip会上移,这行ip就不会进入测试； 所以item需要减1
        item=$(($item - 1))
        echo  测速完 速度小于目标值 delete $item
        i=$item
      fi
    fi
  done

}
# file="https://www.learnwebs.top/file/movie_max.mp4"
file="https://gh-proxy.learnwebs.top/https://github.com/AaronFeng753/Waifu2x-Extension-GUI/releases/download/v2.21.12/Waifu2x-Extension-GUI-v2.21.12-Portable.7z"
rm "C:/Users/duoduo/Desktop/result1.log"
echo 当前速度小于5的节点会被删除
#参数设置ip测速下限
# test_speed 5 >> "./result1.log" 2>&1
test_speed 5
echo "$(date) delete ip start " &>> "C:/Users/duoduo/Desktop/result.log"
./git_push.sh
echo "$(date) delete ip end " &>> "C:/Users/duoduo/Desktop/result.log"

#是否测试所有端口ip 添加新的优选ip 如果节点数量小于 100 才会执行添加新的节点
count_line=$(awk 'END{print NR}' ip.txt)
if [ "$count_line" -gt 50 ]; then
                                echo "节点数量够多了，不需要再筛选了" &>> "C:/Users/duoduo/Desktop/result.log"
                                                                                exit 1
fi
 echo "节点数量bbu" &>> "C:/Users/duoduo/Desktop/result.log"
# echo "$(date) insert ip start " &>> "C:/Users/duoduo/Desktop/result.log"
# cd ..
# echo pwd
# # ./../all-port-node.sh
# ./all-port-node.sh $file
# echo "$(date) insert ip end " &>> "C:/Users/duoduo/Desktop/result.log"

#设置了windows 任务计划  每周1-5，10:30 PM 执行；每周6-7 18:30 AM 执行。
