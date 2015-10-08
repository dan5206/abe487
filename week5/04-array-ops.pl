#!/usr/bin/env/perl
use strict;
use warnings;
use autodie;

my @list = (101, 2, 15, 22, 95, 33, 2, 27, 72, 15, 52);
print "array = ", join(',',@list),"\n";

my $last = pop(@list);
print "popped = ",$last, ",array = ",join(',',@list),"\n";

my $first = shift(@list);
print "shifted = ", $first," array = ",join(',',@list), "\n";

push (@list, 12);
print "after push,array = ",join(',',@list), "\n";

unshift (@list,4);
print "after unshift,array = ", join(',',@list),"\n";

