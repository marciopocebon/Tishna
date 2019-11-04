#!/bin/bash
echo -ne "[+] Enter Binary File Path: "
read binary
perl bufferlocal.pl $binary
