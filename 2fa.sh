#!/bin/bash
echo -ne "[+] Enter Target/Machine/Block: "
read machine
cd 2FAssassign
./assassin.py --scan advanced --target $machine
