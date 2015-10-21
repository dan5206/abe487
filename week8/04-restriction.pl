#!/usr/bin/env/perl
use strict;
use warnings;
use autodie;
use feature 'say';

my $file = shift @ARGV or die "Please provide a sequence or file.\n";
#my $out = shift @ARGV;
open my $fh, '<', $file;
#open my $out_fh, '>', $out;

my @seq=();
while (my $line = <$fh>) {
  chomp $line;
  push @seq, $line;
 }
my $seq=join('',@seq);
my $h=$seq;

while ( $seq =~ /((A|G)AATT(C|T))/g ) {
 $h =~ s/(A|G)AATT(C|T)/$1^AATT$2/;
 }

#print $out_fh "$h";
say "$h";

