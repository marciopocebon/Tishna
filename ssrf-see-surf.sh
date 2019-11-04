#!/bin/bash
echo -ne "[+] Enter Target: "
read target
echo -ne "[~] Requesting external link"
read externallink
python3 see-surf.py -H https://$target -p https://$externallink
