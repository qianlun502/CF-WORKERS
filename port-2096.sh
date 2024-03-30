

read -rp "请输入开启(open)还是关闭(close) port" flag
if [ "$flag" == "open" ]; then
  #start-2096
  firewall-cmd --permanent --add-port=2096/tcp
  firewall-cmd --reload
  firewall-cmd --list-all
#start-2096
fi

if [ "$flag" == "close" ]; then
  #end-2096
  firewall-cmd --permanent --remove-port=2096/tcp
  firewall-cmd --reload
  firewall-cmd --list-all
#end-2096
fi
