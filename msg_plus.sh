echo 使用pushplus 推送消息记录
count_line=$(awk 'END{print NR}' ip.txt)
curl 'https://www.pushplus.plus/api/send' \
  -H 'Accept: */*' \
  -H 'Accept-Language: zh-CN,zh;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/json;charset=UTF-8' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36 Edg/123.0.0.0' \
  -H 'X-Requested-With: XMLHttpRequest' \
  -H 'pushToken: b95202863d0a47b4a4247ed75e4ab586' \
  --data-raw 
