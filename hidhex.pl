#!/usr/bin/perl 
#Usage: hidhex.pl <facility number> <card number>
($facility,$card) = @ARGV;
$oem=1;
$format=1;
#Reference:
#OEM....card_formatEfacil...card number.....O
#                   EEEEEEEEEEEEOOOOOOOOOOOO
#OEM: 0,7
#format: 7,11
#Even Parity: 18,1
#facility: 19,8
#card number:27,16
#Odd parity: 43,1
#Even parity: from 19,12
#Odd parity:  from 31,12
$evenpar=0;
$oddpar=0;
$oembin=sprintf("%07b", $oem);
$formbin=sprintf("%011b", $format);
$facbin=sprintf("%08b", $facility);
$cardbin=sprintf("%016b", $card);
$evenstring=$facbin . substr($cardbin,0,4);
$evencount=$evenstring =~ tr/1//;
$evenpar=$evencount % 2;
$oddstring=substr($cardbin,4);
$oddcount=$oddstring =~ tr/1//;
$oddmod=$oddcount % 2;
$oddpar=$oddmod ^ 1;
$binid= "0b" . $oembin . $formbin . $evenpar . $facbin . $cardbin . $oddpar;
$hexid = oct($binid);
$hexid2=sprintf("%x", $hexid);
#print "  OEM....card_formatEfacil...card number.....O\n";
#print "$binid\n";
print "$hexid2\n";
