use strict;
use warnings;

my $string = "A B C";
my @list = split(' ', $string);
print join('::',@list),"\n";
