#!/usr/bin/env/perl
use strict;
use warnings;
use autodie;
use feature 'say';

my @list = (101, 2, 15, 22, 95, 33, 2, 27, 72, 15, 52);
say "array = ", join(', ',@list);

my $last = pop(@list);
say "popped = ",$last, ",array = ",join(', ',@list);

my $first = shift(@list);
say "shifted = ", $first," array = ",join(', ',@list);

push (@list, 12);
say "after push,array = ",join(', ',@list);

unshift (@list,4);
say "after unshift,array = ", join(', ',@list);

