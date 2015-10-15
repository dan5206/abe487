#!/usr/bin/perl
$s .= chr for 1..255;
print $s,"\n\n";

$s =~ tr/\x20-\x7f//cd;
print $s,"\n\n";
