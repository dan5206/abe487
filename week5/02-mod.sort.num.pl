#!/usr/bin/env/perl
use strict;
use warnings;
use autodie;

my @list = @ARGV;
my (@even_list, @odd_list) = ();
my ($even_sum, $odd_sum) = 0;

unless(@list){
  die "Please provide a list of numbers.\n";
}

foreach my $num (@list){
  if($num % 2 == 0 ){
    push (@even_list, $num);    
  }
  else {
    push (@odd_list, $num);
  }
}

for my $even (@even_list){
 $even_sum += $even;
}

for my $odd (@odd_list){
 $odd_sum += $odd;
}

print "sum evens = ", $even_sum,"\n";
print "sum odds = ", $odd_sum,"\n";
