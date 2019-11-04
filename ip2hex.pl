#!/usr/bin/perl
use strict;
my $ip = shift;

die("no ip was provided\n") unless $ip;

my @octets = split(/\./, $ip);

print "hex version of $ip is: 0x";
foreach my $octet(@octets) {
   $octet =~ s/$octet/sprintf("%X",$octet)/eg;
   print $octet
}
print "\n"; 
