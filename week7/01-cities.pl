#!/usr/bin/env/perl
use strict;
use warnings;
use feature 'say';
use Data::Dumper;

my %hash = (
  "Tucson"     => "AZ",
  "Boston"     => "MA",
  "Jackson"    => "MS",
  "Dixon"      => "NM",
  "Denton"     => "TX",
  "Cincinnati" => "OH",
 );

say Dumper(\%hash);
my $id = 0;
for my $city (sort keys %hash){
 my $state = $hash{$city};
 $id ++;
 say "$id: $city, $state";
}
