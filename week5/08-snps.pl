#!/usr/bin/env/perl
use strict;
use warnings;
use autodie;

my @seq = @ARGV;

if(!@seq or scalar(@seq)>2){
print "Please provide two sequences.\n";
}

elsif( length(my $seq1 = $seq[0]) != length(my $seq2 = $seq[1])){ 
print "Please ensure the sequences are the same length\n";
}

else {
 my @array1 = split //, $seq1;
 my @array2 = split //, $seq2;
 my $snp=0;
 for (my $i=0; $i<scalar(@array1); $i++){
  if ($array1[$i] ne $array2[$i]){
  print "Pos ",$i,": ",$array1[$i],"=>",$array2[$i],"\n"; 
  $snp ++;
  } 
 }
 if ($snp==1){
  print "Found 1 SNP.\n";
 } 
 elsif ($snp>1){
  print "Found $snp SNPs.\n";
 }
 else {
 print "Found 0 SNPs.\n"
}
}
