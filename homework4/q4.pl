#!/usr/bin/env/perl

use strict;
use warnings;
use autodie;
use feature 'say';

my $in = shift @ARGV or die 'No input';
open my $in_fh, '<', $in;

my $line_count = 0;
my $char_count = 0;

while (my $line = <$in_fh>) {
    #chomp($line);
    $line_count++;
    #my $length = length($line);
    $char_count += length($line);
}

say "There are $line_count lines.";
say "There are $char_count characters.";
say "The average line length is ", $char_count / $line_count;

__END__

l. 8: Check for input!

l. 15: Don't chomp as the newline should be counted.  Stats should
match "wc":

 [gila@~/work/students/dan5206/homework4]$ perl q4.pl q3.pl
 There are 40 lines.
 There are 815 characters.1
 The average line length is 20.3751
 [gila@~/work/students/dan5206/homework4]$ wc !$
 wc q3.pl
       40     119     855 q3.pl

l. 16, 18: ++, += mean less typing

l. 17: No need to declare a variable.

ll. 21-23: say == less typing

