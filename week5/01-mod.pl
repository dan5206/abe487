#!/usr/bin/env/perl
use strict;
use warnings;
use autodie;

my @list = @ARGV;
my @even_list = ();

unless(@list){
  die "Please provide a list of numbers.\n";
} 

for my $num (@list){
  if($num % 2 == 0 ){
    push (@even_list, $num);
  }
}

print "evens = ",join(', ',@even_list),"\n";

