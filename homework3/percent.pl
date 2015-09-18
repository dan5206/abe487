#!/usr/bin/perl
use strict;
use warnings;

my $i = shift;
my $j = shift;

if ($i+$j == 0) {
  print "You are tring to trick me!\n";
}
else{
  printf("%.2f%%\n", $i/($i+$j)*100, "\n");
}

