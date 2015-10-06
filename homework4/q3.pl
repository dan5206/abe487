#!/usr/bin/env/perl

use strict;
use warnings;
use autodie;

my $in  = shift @ARGV or die 'Need FASTA file';
my $out = 'outfa.txt';
open my $in_fh, '<', $in;
open my $OUT, '>', $out;

while (my $line = <$in_fh>) {
    chomp($line);
    if ($line =~ /^>seq/) {
        my $seqname = $line;
        print $OUT $seqname, " reverse complement\n";
    }
    else {
        # reverse sequence
        my $revseq = reverse($line);

        # complement the reversed sequence
        $revseq =~ tr/ACGTacgt/TGCAtgca/;
        print $OUT $revseq, "\n";
    }
}

__END__

Check for input!

 [gila@~/work/students/dan5206/homework4]$ perl q3.pl
 Can't open '<undef>' for reading: 'No such file or directory' at q3.pl line 9

vs.

 [gila@~/work/students/dan5206/homework4]$ perl q3.pl
 Need FASTA file at q3.pl line 7.

l. 10: Use a scalar instead of a global symbol
