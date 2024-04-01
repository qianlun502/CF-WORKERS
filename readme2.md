C:\software\v2rayN\CloudflareST_windows_amd64\CF-WORKERS下

getip-depleted-ip.sh   从废弃节点库中获取节点，即回收
git_push.sh 提交git，在线ip库，生成节点需要在线ip文档
ip_tem_auto.sh  从nowip_hosts中获取ip，然后查询地域信息，写入ip.txt
parse_json.sh   格式化json ，获取对应字段
port-2096.sh    开放服务器2096端口，并重启防火墙
starter-ip.sh   ip服务的启动器；根据ip来获取地址，并且将不同地区的ip库写入本地仓库，根据地域的切换来切换不同的ip库，减少筛选的时间。
temp.sh 临时编辑测试，不重要
test-ip-cloudspeedST-everyday.sh    每天测试在线ip库中的ip是否失效，并删除失效ip;如果节点数量小于某值，启动all-port-node.sh 筛选出新的ip

C:\software\v2rayN\CloudflareST_windows_amd64 下：
test-getopts-2.sh   测试getopts 和getopt 短选项和长选项传参
test-getopts.sh
node_create_auto.sh 处理result.csv 生成nowip_hosts.txt文件，生成VLESS节点
cfst_hosts.sh  官方的脚本
all-port-node.sh 筛选所有https（443 2053 2083 2087 2096 8443）或者http端口的ip


/c/software/v2rayN/CloudflareST_windows_amd64/VMESS下：
produce-vmess.sh 生成VMESS节点
ip-vless-to-vmess.sh VLESS节点转VMESS