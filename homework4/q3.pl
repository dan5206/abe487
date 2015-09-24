#!/usr/bin/perl
use strict;
use warnings;
use autodie;

my $in = shift @ARGV;
my $out = 'outfa.txt';
open(my $in_fh, '<', $in ) or die "can't open $in: $!\n";
open(OUT, '>', $out) or die "can't open $out: $!\n";

while(my $line = <$in_fh>){
  chomp ($line);
  if ($line =~ /^>seq/){
    my $seqname = $line;
    print OUT $seqname," reverse complement\n";
  }
  else{
    # reverse sequence
    my $revseq = reverse($line);
    # complement the reversed sequence
    $revseq =~ tr/ACGTacgt/TGCAtgca/;
    print OUT $revseq,"\n";
  }
}
