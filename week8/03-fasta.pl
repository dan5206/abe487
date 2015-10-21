#!/usr/bin/env/perl
use strict;
use warnings;
use autodie;
use feature 'say';

my $file = shift @ARGV or die "Please provide a FASTA file.\n";
open my $fh, '<', $file;

my $seq = 1;
my $count =1;
while( my $line =<$fh>){
  chomp $line;
  if ( $line =~ /^>/) {
   my @head  = split( //, $line);
   shift @head;
   my $header = join('', @head);
   $count = $seq ++;
   say "$count: $header";
  }
  else{ next;}
}

printf "Found %s sequence%s.\n", $count, $count == 1 ? '' : 's';
