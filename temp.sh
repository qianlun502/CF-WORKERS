echo #!/bin/bash
echo #临时编辑
line=$(awk 'END{print NR}' ./CF-WORKERS/ip_template.txt)
echo $line
# line=2
for item in $(seq $line); do
    echo "${item}"
   echo $( sed -n "${item},${item}p" ./CF-WORKERS/ip_template.txt)-$item  &>> ./CF-WORKERS/temp2
done
