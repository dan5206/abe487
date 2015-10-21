#!/usr/bin/env/perl
use strict;
use warnings;
use feature 'say';

my @in = @ARGV or die "Please provide a word or phrase.\n";
my $word = join('',@in);
$word =~ s/[^A-Za-z0-9]//g;
my @pali = split( //, lc($word));
my $pali = join('',@pali);

# Reverse the array 
my @repali = reverse(@pali);
my $repali = join('', @repali);

if ($pali eq $repali){
say "Yes";}
else {say "No";}

#say "@pali";
#say "@repali";
