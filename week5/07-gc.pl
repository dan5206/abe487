#!/usr/bin/env/perl
use strict;
use warnings;
use autodie;

my @list = @ARGV;

unless(@list){
die "Please provide a sequences.\n";
}

for my $seq(@list){
print "-------\n";
print "Seq :$seq\n";
print "Length:", length($seq),"\n";

my @array = split //, uc($seq);
my $GC=0;
for (my $i=0; $i<scalar @array; $i++){
  my $ele= $array[$i];
  if($ele eq "G"||$ele eq "C"){
   $GC = $GC+1;
   }
}

print "#GC :",$GC,"\n";
print "%GC :",$GC/length($seq)*100,"\n";
}
