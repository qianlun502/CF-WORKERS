echo "执行的文件名：$0";
echo "上传IP和result"
str="/c/software/v2rayN/CloudflareST_windows_amd64/CF-WORKERS"
pwd_str=$(pwd)
echo "$pwd_str"
# if [ "$pwd_str" -ne "$str" ]; then `cd "/c/software/v2rayN/CloudflareST_windows_amd64/CF-WORKERS"`; fi
cd "/c/software/v2rayN/CloudflareST_windows_amd64/CF-WORKERS"
echo $(pwd)
git add .
git commit -m "update $(date) ip_result"
git push 
