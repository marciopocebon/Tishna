#!/usr/bin/env perl
use strict;
use warnings;
use lib qw(lib ../lib);
use HTML::Form::XSS;
use WWW::Mechanize;
use Data::Dumper;
if(scalar(@ARGV) != 1){	#check command line args
	print "Usage: $0 <URL with form>\n";
	exit(1);
}
my $url = $ARGV[0];
my $mech = WWW::Mechanize->new();
$mech->get($url);
my @forms = $mech->forms();
foreach my $form (@forms){
	print "Found form:\n";
	print $form->dump();
	print "Test it (y/n)?";
	my $answer = <STDIN>;
	chomp $answer;
	if($answer ne "y"){
		next;
	}
	my $checker = HTML::Form::XSS->new($mech, config => '/home/config.xml');
	my @results = $checker->do_audit($form);
	my $vuln = 0;
	foreach my $result (@results){
		if($result->vulnerable()){
			$vuln = 1;
			my $example = $result->example();
			print "Example of vulnerable URL: $example\n";
			last;
		}
	}
	if(!$vuln){
		print "Form not vulnerable :-)\n";
	}
}
exit();
