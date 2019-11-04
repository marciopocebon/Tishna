#!/bin/bash
echo -ne "[+] Enter Target: "
read target
nmap --script http-methods $target
