#!/usr/bin/perl
use strict;
use warnings;

my $str1 = <STDIN>;
my $str2 = <STDIN>;

if ($str1 eq $str2) {
  print "same\n";
}
else{
  print "different\n";
}


