#!/usr/bin/env/perl
use strict;
use warnings;
use autodie;

my @list = @ARGV;

unless(@list){
  die "Please provide a list of numbers.\n";
}

## default sorting
my @sorted = sort @list;
print "default sort = ",join(',',@sorted),"\n";

## sort numerically
@sorted = sort {$a <=> $b}@list;
print "numerical sort = ",join(',',@sorted),"\n";

## reserve sorting
@sorted = sort {$b <=> $a}@list;
print "reverse numercial sort = ",join(',',@sorted),"\n";

