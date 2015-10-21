#!/usr/bin/perl -w
use strict;
use warnings;
#use autodie;
use feature 'say';

my @seq=();
while(<>){
@seq = split(/\^/);
my @sorted = sort { length($a) <=> length($b) } @seq;
for (@sorted) {
  print "$_\n";
 }
}
