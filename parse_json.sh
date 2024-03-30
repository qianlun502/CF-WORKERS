# json={"status":"success","country":"加拿大","countryCode":"CA","region":"ON","regionName":"安大略","city":"多伦多","zip":"M5A","lat":43.6532,"lon":-79.3832,"timezone":"America/Toronto","isp":"Cloudflare, Inc.","org":"Cloudflare, Inc.","as":"AS13335 Cloudflare, Inc.","query":"104.16.166.126"};
#解析 cdn 地址 
NOWIP='172.67.209.5'
 request_body=$(curl -s https://ip125.com/api/"${NOWIP}"?lang=zh-CN)
  echo $request_body  &> json.txt
echo "$json"
#  echo $(awk -F"," $request_body)
country=$(grep -o '"country":"[^"]*' json.txt | grep -o '[^:]*$' | grep -o '[^"]*$')
city=$(grep -o '"city":"[^"]*' json.txt | grep -o '[^:]*$' | grep -o '[^"]*$')
timezone=$(grep -o '"timezone":"[^"]*' json.txt | grep -o '[^:]*$' | grep -o '[^"]*$')
echo "$country-$city-$timezone"