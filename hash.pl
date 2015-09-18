use strict;
use warnings;

my %turtle = (
  'a' => '5',
  'b' => '2',
  'c' => '8',
  'd' => '4',
); 

print join(';',sort keys %turtle),"\n";
print join(';',sort values %turtle),"\n";

my %ordinal =(
  1 => 'first',
  2 => 'second',
  3 => 'third',
  10 => 'tenth',
);
print join(';',$a<=>$b, sort keys %ordinal),"\n";
