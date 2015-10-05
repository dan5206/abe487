#!/usr/bin/env/perl
use strict;
use warnings;
use autodie;

my $in = 'Perl_III.nobody.txt';
open my $in_fh, '<', $in;

while (my $line = <$in_fh>) {
  chomp $line;
  my $index_nb = index($line,'Nobody');
  my $index_sb = index($line,'somebody');
  if ($index_nb >= 0) {
     warn("Nobody is here: $index_nb.\n");
  }
  if ($index_sb >= 0) {
     warn("Somebody is here: $index_sb.\n");
  }
}
