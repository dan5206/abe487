#!/usr/bin/perl
use strict;
use warnings;
use autodie;

my $in = shift @ARGV;
open my $in_fh, '<', $in;

my $line_count = 0;
my $char_count = 0;

while (my $line = <$in_fh>) {
 chomp ($line);
 $line_count = $line_count + 1;
 my $length = length ($line);
 $char_count = $char_count + $length;
}
print "There are $line_count lines.\n";
print "There are $char_count characters.\n";
print "The average line length is ",$char_count/$line_count,"\n";

