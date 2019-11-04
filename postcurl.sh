#!/bin/bash
echo -e "[+] Enter Filename"
read filename
echo -e "[+] Enter Base URL"
read baseurl
echo -e "[+] Enter Host"
read host
echo -e "[+] Enter Attacker Web"
read attacker
echo -e "[+] Enter Attacker Web Filename"
read attackerfilename
echo -e "[+] Enter Values"
read values
echo -e "[+] Cookie session"
read session
echo -e "[+] Enter your post body"
read body


curl -i -d '"$values" $baseurl
HTTP/1.1 200 OK
Host: $host
Origin: $attacker
Referer: $attacker/$attackerfilename
Cookie: SESSION=$session
Content-Type: application/x-www-form-urlencoded

$postbody'
