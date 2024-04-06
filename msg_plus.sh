echo 使用pushplus 推送消息记录
params_push="{
\"token\": \"409ea8a9a1cc4854ad3ca04c019dcc81\",
        \"title\": title,
        \"content\": msg,
        \"template\": \"html\",
        \"channel\": \"wechat\", }"
url_push='https://www.pushplus.plus/send'
echo "$params_push"
