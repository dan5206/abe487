#!/usr/bin/perl
use strict;
use warnings;
use autodie;

my $in = 'numbers.txt';
my $out = 'numberout.txt';
open(my $in_fh, '<', $in ) or die "can't open $in: $!\n";
open(OUT, '>', $out ) or die "can't open $out: $!\n";

my $factorial = 1;

while (my $num = <$in_fh>) {
  chomp $num;
  if ($num % 2 == 0 and $num <= 24) {
       print OUT $num,"\n";
  }
  else {
    while($num > 0){
      $factorial = $factorial * $num;
      $num = $num-1;
    }
    print OUT $factorial,"\n";
  }
}
