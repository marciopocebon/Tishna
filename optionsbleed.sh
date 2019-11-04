#!/bin/bash
cd optionsbleed/
echo ""
read -p "[ + ] Enter Target Again: " Target
./optionsbleed -u $Target
