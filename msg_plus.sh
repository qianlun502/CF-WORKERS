echo 使用pushplus 推送消息记录
function getopts_params2() { #直接解析，不适用getopt
  echo $@
  ARGS=$@
  echo $ARGS
  eval set -- $ARGS
  while [ true ]; do
    case "${1}" in
      -refer)
        echo "refer = $2"
        refer=$2
        shift 2
        ;;
      -file)
        echo "file = $2"
        file=$2
        shift 2
        ;;
      -path)
        echo "file = $2"
        path=$2
        shift 2
        ;;
      --)
        echo end
        break
        ;;
            "")
        echo "echo end"
        break
        ;;
      *)
        echo "default (none of above)"
        exit 1
        ;;
    esac

  done

}
# https://www.pushplus.plus/push1.html

echo 调用的程序名称 $@
getopts_params2 $@
echo  ${refer}
file=${fill:-ip.txt}
count_line=$(awk 'END{print NR}' "$file")
json_body="{\"token\":\"3259650b04724322bb80e7c3c8133402\",\"title\":\"work task success\",\"content\":\" now ip count $count_line,\"template\":\"html\",\"channel\":\"wechat\"}"
curl 'https://www.pushplus.plus/api/send' \
  -H 'Accept: */*' \
  -H 'Accept-Language: zh-CN,zh;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/json;charset=UTF-8' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36 Edg/123.0.0.0' \
  -H 'X-Requested-With: XMLHttpRequest' \
  --data-raw '{"token":"3259650b04724322bb80e7c3c8133402","title":" task success end ","content":"'${refer}' : count '$count_line'","template":"html","channel":"wechat"}'
