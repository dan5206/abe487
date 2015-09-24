#!/usr/bin/perl
use strict;
use warnings;
use autodie;

my $in = shift @ARGV;
my $out = shift @ARGV;
open(my $in_fh, '<', $in ) or die "can't open $in: $!\n";
open(my $out_fh, '>', $out) or die "can't open $out: $!\n";

while(my $line = <$in_fh>){
  chomp ($line);
  my $upper = uc $line;
  print $out_fh "$upper\n";
}
