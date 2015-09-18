#!/usr/bin/perl

use strict;
use warnings;
use feature 'say';

unless(@ARGV){
 die "where are my argments?\n";
}


say "The args are ",join(',',@ARGV);
say "There are ",scalar(@ARGV)," arguments";
my $first = shift @ARGV;
say "My first arg is '$first'";
say "The args are now ", join(',',@ARGV);

#sub report(
#  my @args = @_;
#  my ($first, $second, @rest) = @_;
#  my ($frist, $second, @rest) = split(/,/, "john,paul,rings.geri");
#)
