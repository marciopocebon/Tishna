#!/usr/bin/perl
 
# This is a simple script that interactively converts an IP address to
# its decimal equivalent. This can sometimes be used to bypass web content
# filtering devices as not all will convert the decimal to an IP and then a
# hostname.
#
# prompt for an IP
print "Enter an IP Address: ";
 
# get the users input
$_ = <STDIN>;
 
# remove the newline "\n" character
chomp($_);
 
# should validate the input, but this was a simple/quick program
$converteddecimal = ip2dec($_);
$convertedip = dec2ip($converteddecimal);
 
print "\nIP address: $_\n";
print "Decimal: $converteddecimal\n";
 
# print "IP: $convertedip\n";
 
# this sub converts a decimal IP to a dotted IP
sub dec2ip ($) {
    join '.', unpack 'C4', pack 'N', shift;
}
 
# this sub converts a dotted IP to a decimal IP
sub ip2dec ($) {
    unpack N => pack CCCC => split /\./ => shift;
}
