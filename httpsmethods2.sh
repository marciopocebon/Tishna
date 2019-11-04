#!/bin/bash
echo -ne "[+] Enter Target: "
read target
nmap -p 443 --script http-security-headers $target
