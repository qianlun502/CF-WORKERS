@REM "D:\Program Files\Git\bin\bash.exe" --login -i -c  ""
cd "C:/software/v2rayN/CloudflareST_windows_amd64/CF-WORKERS"
"D:\Program Files\Git\bin\bash.exe" --login -i -c "pwd"
"D:\Program Files\Git\bin\bash.exe" --login -i -c  " ./test-ip-cloudspeedST-everyday.sh"
"cd .."
"D:\Program Files\Git\bin\bash.exe" --login -i -c  "./all-port-node.sh"
pause
@REM https://blog.csdn.net/themagickeyjianan/article/details/127487205 bat调用sh程序