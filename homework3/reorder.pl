#!/usr/bin/perl
use strict;
use warnings;

my $arg1 = shift;
my $arg2 = shift;

if (($arg1 cmp $arg2) < 0) {
  print "$arg1 $arg2\n";
}
else{
  print "$arg2 $arg1\n";
}


