#!/usr/bin/perl
use strict;
use warnings;

my $arg1 = shift;
my $arg2 = shift;

if (($arg1 cmp $arg2) < 0) {
  print "right order\n"; 
}
else{
  print "wrong order\n";
}
