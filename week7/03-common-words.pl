#!/usr/bin/env/perl
use strict;
use warnings;
use autodie;
use feature 'say';

@ARGV == 2 or die "Please provide two files.\n";
my $file1 = shift @ARGV;
my $file2 = shift @ARGV;
open my $fh1, '<', $file1;
open my $fh2, '<', $file2;

my %file1;
while (my $line1 = <$fh1>){
 chomp $line1;
 my @file1 = split /\s+/, $line1; 
 for my $word1 (@file1){
  $word1 =~ s/[^A-Za-z0-9]//g;
  $file1{lc $word1} ++; 
 }
} 


my %file2;
while (my $line2 = <$fh2>){
 chomp $line2;
 my @file2 = split /\s+/, $line2;
 for my $word2 (@file2){
  $word2 =~ s/[^A-Za-z0-9]//g;
  $file2{lc $word2} ++;
 }
}

my @common=();
for (sort keys %file1){
 if( exists $file2{$_}) {
  push (@common, $_);
 }
}

for my $cword (@common){
 say $cword;
}
say "Found ", scalar @common, " words in common.";
