#!/usr/bin/env/perl
use strict;
use warnings;
use autodie;

my @list = @ARGV;

unless(@list){
  die "Please provide a list of sequences.\n";
}

my @sorted = sort{$a cmp $b}(@list);
print "sorted = ", join(', ',@sorted),"\n";

my @re_sorted = sort{$b cmp $a}(@list);
print "reverse = ",join(', ',@re_sorted),"\n";

