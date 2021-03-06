#!/usr/bin/env/perl

use strict;
use warnings;
use autodie;

my $x   = shift;
my $y   = shift;
my $out = 'out.txt';
my $err = 'err.txt';

#open my $out_fh, '>', $out;
#open STDERR, '>', $err;

unless (defined $x and defined $y) {
    die "Please provide two numbers.\n";
}

if ($x > 0 and $y > 0) {
    my $out_divide = $x / $y;
    print $out_divide, "\n";
}
elsif ($y == 0) {
    print STDERR "The divisor cannot be zero.\n";
}
elsif ($x < 0 or $y < 0) {
    print STDERR "Please provide two positive numbers.\n";
}

__END__

l. 13: Don't open STDERR, just print to it.

Instructions are to print STDOUT/STDERR and let user sort it:

  $ prog 1>out 2>err

One point off.
