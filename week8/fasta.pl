#!/usr/bin/env/perl
use strict;
use warnings;
use autodie;
use feature 'say';

my $file = shift @ARGV or die "Please provide a FASTA file.\n";
open my $fh, '<', $file;

my $id;
my $seq = 1;
my $count =1;
while( my $line =<$fh>){
  chomp $line;
  if (substr($line, 0, 1) eq '>'){
    $id = substr($line, 1);
    $count = $seq ++;
    say "$count: $id";
   }
  else{next;}
}

printf "Found %s sequence%s.\n", $count, $count == 1 ? '' : 's';
