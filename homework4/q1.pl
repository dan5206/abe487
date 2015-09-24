#!/usr/bin/perl
use strict;
use warnings;
use autodie;

my $x = shift;
my $y = shift;
my $out = 'out.txt';
my $err = 'err.txt';

open (my $out_fh, '>', $out) or die "can't open $out: $!\n";
open (STDERR, '>', $err) or die "can't open $err: $!\n"; 

unless( defined $x and defined $y){
  die "Please provide two numbers.\n";
}

if( $x>0 and $y>0 ){
  my $out_divide = $x/$y;
  print $out_fh $out_divide, "\n";
}
elsif( $y==0 ){
  print STDERR "The divisor cannot be zero.\n"
}
elsif( $x<0 or $y<0 ){
  print STDERR "Please provide two positive numbers.\n";
}


