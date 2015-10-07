#!/usr/bin/env/perl

use strict;
use warnings;
use autodie;

@ARGV == 2 or die 'Need input/ouput';

my $in  = shift @ARGV;
my $out = shift @ARGV;
open my $in_fh,  '<', $in;
open my $out_fh, '>', $out;

while (my $line = <$in_fh>) {
    my $upper = uc $line;
    print $out_fh "$upper";
}

__END__

You didn't check for input!

 [gila@~/work/students/dan5206/homework4]$ perl q2.pl
 Can't open '<undef>' for reading: 'No such file or directory' at q2.pl line 9

Don't chomp if you're going to print a newline.
