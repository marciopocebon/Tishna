#!/bin/bash
cd jwt_tool
echo "Hint: Intercepting the web request with Burp Suite" 
echo "it gives a X-Auth Token value that is dots separated by" 
echo "by base64URL encoded values which is known as JWT token" 
echo "Method: https://medium.com/iqube-kct/simple-jwt-hacking-73870a976750"
echo "";
echo -ne "[+] Enter Token: "
read target
python jwt_tool.py $target /use/share/wordlists/rockyou.txt

