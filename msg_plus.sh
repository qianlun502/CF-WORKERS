echo 使用pushplus 推送消息记录

curl 'https://www.pushplus.plus/api/send' \
  -H 'Accept: */*' \
  -H 'Accept-Language: zh-CN,zh;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/json;charset=UTF-8' \
  -H 'Origin: https://www.pushplus.plus' \
  -H 'Referer: https://www.pushplus.plus/push1.html' \
  -H 'Sec-Fetch-Dest: empty' \
  -H 'Sec-Fetch-Mode: cors' \
  -H 'Sec-Fetch-Site: same-origin' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36 Edg/123.0.0.0' \
  -H 'X-Requested-With: XMLHttpRequest' \
  -H 'pushToken: b95202863d0a47b4a4247ed75e4ab586' \
  -H 'sec-ch-ua: "Microsoft Edge";v="123", "Not:A-Brand";v="8", "Chromium";v="123"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "Windows"' \
  --data-raw '{"token":"3259650b04724322bb80e7c3c8133402","title":"自动任务success","content":"当前ip数量为count_line=$(awk 'END{print NR}' ip.txt)","template":"html","channel":"wechat"}'
