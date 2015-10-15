#!/usr/bin/env/perl
use strict;
use warnings;
use feature 'say';
use autodie;

my $file = shift || 'Perl_V.genesAndSeq.txt';
open my $fh, '<', $file;
my %hash;
my ($key, $value);
my @seq;

while (my $line = <$fh>) {
  chomp $line;
  if ( $line =~ /^>/) {
     my @head  = split( //, $line);
     shift @head;
     $key=join('', @head);
     @seq=();
   }
  else {
     push @seq, $line;
     $value = join('', @seq);
  }
  $hash{$key}=$value;
}

for $key ( sort {length($hash{$a}) <=> length($hash{$b})} keys %hash){
 my $length = length ($hash{$key});
 say "$key: $length";
}

