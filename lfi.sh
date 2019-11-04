#!/bin/bash
echo -ne "[+] Enter Target /w Parameter: "
read target
./lfi.py --url=$target
