#!/bin/bash
echo -ne "[+] Enter Target: "
read target
echo -ne "[+] Enter File Type: "
read filetype
python3 fuxploider.py --url $target --not-regex "wrong file type"
python3 fuxploider --url $target/$filetype --not-regex "error" --template phpinfo
