#!/usr/bin/env/perl
use strict;
use warnings;
use autodie;

my @list = @ARGV;

unless(@list){
  die "Please provide a list of sequences.\n";
}

my @sorted = sort { length($a) cmp length($b) } @list;
print "sorted = ", join(', ',@sorted),"\n";

my @re_sorted = sort { length($b) cmp length($a) } @list;
print "reverse = ",join(', ',@re_sorted),"\n";


