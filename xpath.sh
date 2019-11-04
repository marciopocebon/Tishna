#!/bin/bash
echo -ne "[+] Enter Victim in Absolute Parameter Format: "
read Victim
python2 xpath.py -u "$Victim" --dbs --technique=X
