echo 使用pushplus 推送消息记录
params_push="{
\"token\": \"409ea8a9a1cc4854ad3ca04c019dcc81\",
        \"title\": title,
        \"content\": msg,
        \"template\": \"html\",
        \"channel\": \"wechat\", }"
url_push='https://www.pushplus.plus/send'

curl 'https://eva2.csdn.net/v3/06981375190026432f77c01bfca33e32/lts/groups/dadde766-b087-42da-8e67-d2499a520ee7/streams/a0119567-bf91-4314-ab75-f683ba6c0c0a/logs' \
  -H 'Accept: */*' \
  -H 'Accept-Language: zh-CN,zh;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/json' \
  -H 'Lts-Sdk-Request-Id: 71c9321516934eaa97c3655c34abcfa6' \
  -H 'Lts-Sdk-Version: 1.0.15' \
  -H 'Origin: https://blog.csdn.net' \
  -H 'Referer: https://blog.csdn.net/baidu_35692846/article/details/107516123' \
  -H 'Sec-Fetch-Dest: empty' \
  -H 'Sec-Fetch-Mode: cors' \
  -H 'Sec-Fetch-Site: same-site' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36 Edg/123.0.0.0' \
  -H 'X-Sdk-date: 20240406T120640Z' \
  -H 'sec-ch-ua: "Microsoft Edge";v="123", "Not:A-Brand";v="8", "Chromium";v="123"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "Windows"' \
  --data-raw '{"labels":{},"logs":[{"contents":[{"pid":"blog","ref":"https://cn.bing.com/","curl":"https://blog.csdn.net/baidu_35692846/article/details/107516123","spm":"1001.2101","extra":"{\"x\":932,\"y\":168,\"ev\":\"move\"}","tos":9,"adb":"1","cCookie":"c_session_id=10_1712405143279.798721;c_pref=;c_ref=https%3A//cn.bing.com/;c_first_ref=cn.bing.com;c_first_page=https%3A//blog.csdn.net/baidu_35692846/article/details/107516123;c_dsid=11_1712405143803.441447;c_segment=7;c_page_id=default;c_adb=1;c_sid=499e5f7bfec81fd16f252591e844253f;","t":1712405200,"screen":"1536*864","urn":"1712405143810-8c1b938d-3584-49e0-be2a-ebbc1f1ef3a8","vType":"","log_id":"43","sign":"2f5506a71a2c029ba4fef21a80631a4c","userAgent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36 Edg/123.0.0.0","cid":"10_10393033870-1710479544163-836999","uid":"","sid":"10_1712405143279.798721","dc_sid":"","did":"10_10393033870-1710479544163-836999","utm":"","un":"","__client_time__":1712405200454}]}]}'
echo "$params_push"
