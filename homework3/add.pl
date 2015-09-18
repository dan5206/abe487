#!/usr/bin/perl
use strict;
use warnings;

my $a = shift;
my $b = shift;

unless( defined $a and defined $b){
  die "Please provide two numbers.\n";
}

if( $a>=0 and $b>=0){
  print $a+$b,"\n";
}
else{
  print "Please provide two positive numbers.\n";
}
