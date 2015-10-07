#!/usr/bin/env perl

use strict;
use warnings;
use autodie;

my $in  = 'numbers.txt';
my $out = 'numberout.txt';
open my $in_fh,  '<', $in;
open my $out_fh, '>', $out;

#my $factorial = 1;

while (my $num = <$in_fh>) {
    chomp $num;
    if ($num % 2 == 0 and $num <= 24) {
        print $num, "\n";
    }
    else {
        my $factorial = 1;
        while ($num > 0) {
            $factorial = $factorial * $num;
            $num       = $num - 1;
        }
        print $out_fh $factorial, "\n";
    }
}

__END__

Almost!  

l. 17: Just "print" so it goes to STDOUT.  

l. 12: $factorial needs to be declared lower -- you raise 
it and then keep going -- it never gets reset to 1
