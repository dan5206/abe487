#!/usr/bin/env/perl
use strict;
use warnings;
use feature 'say';
#use autodie;

my $seq;
my $data;
my $file = $ARGV[0] or die "Please provide a sequence.\n";
if ( open $data,'<', $file){
  $seq = <$data>;
  if( !defined $seq ){
    die "Zero-length sequence.\n"
  }
} else {
  $seq = "$file";
} 
my $k = $ARGV[1];
my $mer;


if (length($seq) == 1 ){
   say "Cannot get any 3 mers from a sequence of length 1.";
   }

elsif (length($seq) == 2 ){
   say "Cannot get any 3 mers from a sequence of length 2.";
   }

else {
  if (!defined $k) {
   $k = length($seq);
   $mer = $seq;
  }
  my @kmers;
  my  $len = length($seq);
  my  $nmer = $len-$k+1;
  for (my $i = 0; $i + $k <= $len; $i++) {
        push @kmers, substr($seq, $i, $k);
    }

  my %hash;
  for my $base (@kmers){
    $hash{$base} ++;
  }
  
  my @uni = keys (%hash);
  my $unicount = scalar(@uni);   
  my @value = values(%hash);
  
  my $scount = 0;
  for (my $j = 0; $j < scalar @value; $j++) {
      my $knum = $value[$j];
      if ($knum == 1) {
      $scount ++;
     }
    }
  
  printf "%-15s %10s\n", "Sequence length", $len; 
  printf "%-15s %10s\n", "Mer size", $k;
  printf "%-15s %10s\n", "Number of kmers", $nmer;
  printf "%-15s %10s\n", "Unique kmers", $unicount;
  printf "%-15s %10s\n", "Num. singletons", $scount; 
  
  if( $nmer > 1 ){
  say "Most abundant";
  my $numline = 0;
  for my $base (sort { $hash{$b} <=> $hash{$a} || $a cmp $b } keys %hash){
    my $count = $hash{$base};
    $numline ++ ;
    if( $count == 1 || $numline > 10) {
      last;
     }
    say "$base: $count"; 
   }
  }
}

