echo "执行的文件名：$0"
#将本地优选出来的ip写入到ip.txt文件中。
# 35.220.252.88:50538#HK
str="/c/software/v2rayN/CloudflareST_windows_amd64/CF-WORKERS"
if [ $(pwd) != "$str" ]; then
  cd "/c/software/v2rayN/CloudflareST_windows_amd64/CF-WORKERS"
  echo 1
fi
address_nowip_hosts="../nowip_hosts.txt" #待生成节点ip
# address_nowip_hosts="ip-2.txt" # 历史ip

port_ip=2083
if [ "$1" -ne $port_ip ]; then
                               port_ip=$1
                                           echo "使用传入参数$1"
fi
if [[ ! -e ${address_nowip_hosts} ]]; then touch "nowip_hosts.txt"; fi
count_line=$(awk 'END{print NR}' $address_nowip_hosts)
count_line_iptxt=$(awk 'END{print NR}' "ip.txt")
echo " ip.txt count:${count_line_iptxt}" //当中间的节点被删除时不适用
# echo -e "\n" &>> ip.txt

# 解析JSON
get_address() { #函数参数通过$1,$2,$3 直接获取
  # NOWIP='172.67.209.5'
  # request_body=$(curl -s https://ip125.com/api/"${NOWIP1}"?lang=zh-CN)
  request_body=$(curl -s https://ip125.com/api/"$1"?lang=zh-CN)
  echo "$request_body"  &> json.txt

  #  echo $(awk -F"," $request_body)
  country=$(grep -o '"country":"[^"]*' json.txt | grep -o '[^:]*$' | grep -o '[^"]*$')
  city=$(grep -o '"city":"[^"]*' json.txt | grep -o '[^:]*$' | grep -o '[^"]*$')
  # timezone=$(grep -o '"timezone":"[^"]*' json.txt | grep -o '[^:]*$' | grep -o '[^"]*$')
  #  return $(("$country-$city-$timezone"))# return 只能返回0-255 ，其余使用echo 输出
  echo "${NOWIP}:${port_ip}#""$country-$city-$2" &>> ip.txt
}
# 解析JSON
line_ip_max=$(awk -F '-' 'END{print $3}' ip.txt)
echo ${line_ip_max}
for item in $(seq "$((count_line))"); do
  #   if [ "$item" -le 1 ]; then continue; fi
  NOWIP=$(sed -n "${item},${item}p" $address_nowip_hosts)
    echo "${item}—— $NOWIP"  #输出ip
    #sed 's/要被取代的字串/新的字串/g'
    # sed -e 's/'ip_address'/'"$NOWIP"'/g' ./template_node.txt &>> outfile
    # sed -e 's/'ip_address'/'"$NOWIP"'/g' "temporary" &>> outfile
  #   echo -e "\n" &>> outfile

  # https://ip125.com/api/183.95.251.210?lang=zh-CN
  # request_body=$(curl -s https://ip125.com/api/"${NOWIP}"?lang=zh-CN)
  # echo "$request_body"
  # count_line_iptxt=$((count_line_iptxt + 1)) #第几个节点  当中间的节点被删除时不适用 可能会有重复。
  line_ip_max=$((line_ip_max + 1)) #第几个节点
  if [ -z "${NOWIP}" ]; then
                             echo "空ip"
                                          continue
  fi
  # get_address "$NOWIP" "$item"
  get_address "$NOWIP" "$line_ip_max"
    # echo ${NOWIP}:${port_ip}#${count_line_iptxt} &>> ip.txt
done
# echo -e "\n" &>>ip.txt

./git_push.sh
