#!/usr/bin/env/perl
use strict;
use warnings;
use autodie;

my @seq = @ARGV;

if ( !@seq or scalar(@seq) > 2 ) {
    print "Please provide two sequences.\n";
}
elsif ( length( my $seq1 = $seq[0] ) != length( my $seq2 = $seq[1] ) ) {
    print "Please ensure the sequences are the same length\n";
}

else {
    my @array1 = split //, $seq1;
    my @array2 = split //, $seq2;
    my $snp    = 0;
    print join( ' ', @array1 ), "\n";
    for ( my $i = 0 ; $i < scalar(@array1) ; $i++ ) {
        if ( $array1[$i] eq $array2[$i] ) {
            print "| ";
        }
        else {
            print "* ";
        }
    }
    print "\n", join( ' ', @array2 ), "\n";
}

__END__

Great job!
