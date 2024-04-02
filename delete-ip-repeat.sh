function get_params() {
    args=$@
    echo "$args"
    eval set -- "$args"
    while [ true ]; do
    case "${1}" in
        -filename)
            echo "filename=$2"
            filename=$2
            shift 2
        ;;
        -filepath)
            echo "filepath= $2"
            filepath=$2
            shift 2
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
echo 删除重复ip:port
echo 请传入filename 和file path
get_params $@
#depleted-ip去重
# get_params -filename depleted-ip.txt -filepath "C://software//v2rayN//CloudflareST_windows_amd64//CF-WORKERS"
# # ip库去重
# get_params -filename ip.txt -filepath "C://software//v2rayN//CloudflareST_windows_amd64//CF-WORKERS"
echo $(pwd)

eval "cd $filepath"
echo $(pwd)
filename=depleted-ip.txt

#先输出文档重复行
awk -F'#' '{print $1}' $filename | sort -r | uniq -d &> repeat
repeat_count=$(awk 'END{print NR}' repeat)
echo 重复文本数量：$repeat_count
for ((i = 1; i <= $repeat_count; i++)); do
    echo "${i}"
    line_txt=$(sed -n "${i},${i}p" repeat)
    echo $line_txt
    #line_txt 文本重复次数
    delete_count=$( cat  $filename | grep "$line_txt" | awk -F ' ' '{print $1}'|awk -F '#' '{print $1}' | sort -r | uniq -c | awk '{print $1}')
    echo delete_count: $delete_count

    for ((j = 1; j < $delete_count; j++)); do
        echo "delete_count ${j}"
    #将被删除记录的行号，并取一行。
    line_num=$(cat  $filename | grep -n "$line_txt" | awk -F ':' '{print $1}' | sed -n '1,1p')
    sed -i "${line_num},${line_num}d" $filename
  done

done
