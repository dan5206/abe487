#!/usr/bin/env/perl
use strict;
use warnings;
use autodie;
use feature 'say';
use Data::Dumper;

my $file1 = shift @ARGV;
my $file2 = shift @ARGV;
my $file3 = shift @ARGV;
my $file4 = shift @ARGV;
open my $fh1, '<', $file1;
open my $fh2, '<', $file2;
open my $fh3, '<', $file3;
open my $fh4, '<', $file4;

my $out1 = 'core.txt';
open my $out_fh1, '>', $out1;
my $out2 = 'variable.txt';
open my $out_fh2, '>', $out2;

my %file1;
my %sortfile1;

while (my $line1 = <$fh1>){
 chomp $line1;
 my ($id1, $match1) = split /,/, $line1;
 $file1{$id1} = $match1; 
} 

for my $id1 (sort { $file1{$b} <=> $file1{$a} } keys %file1){
 my $match1 = $file1{$id1};
 if ($match1 < 50){
   last;
 }
 $sortfile1{$id1} = $match1;
}

##################################################
my %file2;
my %sortfile2;

while (my $line2 = <$fh2>){
 chomp $line2;
 my ($id2, $match2) = split /,/, $line2;
 $file2{$id2} = $match2;
}

for my $id2 (sort { $file2{$b} <=> $file2{$a} } keys %file2){
 my $match2 = $file2{$id2};
 if ($match2 < 50){
   last;
 }
 $sortfile2{$id2} = $match2;
}

################################
my %file3;
my %sortfile3;

while (my $line3 = <$fh3>){
 chomp $line3;
 my ($id3, $match3) = split /,/, $line3;
 $file3{$id3} = $match3;
}

for my $id3 (sort { $file3{$b} <=> $file3{$a} } keys %file3){
 my $match3 = $file3{$id3};
 if ($match3 < 50){
   last;
 }
 $sortfile3{$id3} = $match3;
}

###############################
my %file4;
my %sortfile4;

while (my $line4 = <$fh4>){
 chomp $line4;
 my ($id4, $match4) = split /,/, $line4;
 $file4{$id4} = $match4;
}

for my $id4 (sort { $file4{$b} <=> $file4{$a} } keys %file4){
 my $match4 = $file4{$id4};
 if ($match4 < 50){
   last;
 }
 $sortfile4{$id4} = $match4;
}

my %filenew;
for my $x ( keys %sortfile1 ){
    if (exists  $sortfile2{$x} 
        and  exists $sortfile3{$x}
        and  exists $sortfile4{$x}) 
     {
        $filenew{$x} = [$sortfile1{$x}, $sortfile2{$x}, $sortfile3{$x}, $sortfile4{$x}]
    }
   else {
      next;
   } 
}

print $out_fh1 "$_\n" for keys %filenew;

my %allfile = (%sortfile1, %sortfile2, %sortfile3, %sortfile4);
my %filenew2;
for my $x ( keys %allfile ){
    if (exists $filenew{$x})
     {
      	next;
    }
    else {
      $filenew2{$x} = $allfile{$x}
   }
}

print $out_fh2 "$_\n" for keys %filenew2;

