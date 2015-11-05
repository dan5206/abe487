#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use feature 'say';
use Getopt::Long;
use Pod::Usage;
use Bio::SeqIO;
use Bio::DB::Fasta;
use Pod::Usage;
use List::Util qw(min max);

my %opts = get_opts();

unless (@ARGV == 2) {
    pod2usage();
}

my ($dbfile, $pattern) = @ARGV;

if ($opts{'help'} || $opts{'man'}) {
    pod2usage({
        -exitval => 0,
        -verbose => $opts{'man'} ? 2 : 1
    });
}

my $re_pat = $pattern;
#$re_pat =~ s/[^A-Za-z0-9]//g; 
$re_pat =~ s/\W//g; 
#open my $out, '>', "$re_pat.fa";

my $out = Bio::SeqIO->new(-file => '>' . $re_pat . ".fa", -format => 'Fasta');

# for multiple pattern
my ( @plist, @word, @num, @pa_list );
if ( $re_pat ne $pattern ) {
    @plist = split( //, $re_pat );
    @word = grep ( /\D/, @plist );
    @num  = grep ( /\d/, @plist );
    my $min = min @num;
    my $max = max @num;
    for ( $min .. $max ) {
        push @pa_list, join( '', @word, $_ );
    }
}
else {
    @pa_list = ();
    push @pa_list, $pattern;
}

my $db_obj   = Bio::DB::Fasta->new($dbfile);
my @ids      = $db_obj->get_all_primary_ids;
my $count    = 0;
my @matchseq = ();
for my $fa_ids (@ids) {
    my ( $header, $newseq );
    for my $match (@pa_list) {
        if ( $fa_ids =~ /$match/ ) {
            my $id_seq_obj = $db_obj->get_Seq_by_id($fa_ids);
            $out->write_seq($id_seq_obj);
            #my $seq_obj    = $id_seq_obj->seq;
            #my $des_seq    = $id_seq_obj->desc;
            #$header = join( " ", join( '', ">", $fa_ids ), $des_seq );
            #$newseq = join( "\n", $header, $seq_obj );
            #print $out $newseq, "\n";
            $count++;
        }
    }
}

print "Searching '$dbfile' for '$pattern'\n";
print "Found $count ids.\n";
if ( $count != 0 ) {
    print "See results in '$re_pat.fa'\n";
}
# --------------------------------------------------
sub get_opts {
    my %opts;
    GetOptions(
        \%opts,
        'help',
        'man',
    ) or pod2usage(2);

    return %opts;
}

__END__

# --------------------------------------------------

=pod

=head1 NAME

02-fasta-search.pl - a script

=head1 SYNOPSIS

  02-fasta-search.pl file.fa pattern 

Options:

  --help   Show brief help and exit
  --man    Show full documentation

=head1 DESCRIPTION

Describe what the script does, what input it expects, what output it
creates, etc.

=head1 SEE ALSO

perl.

=head1 AUTHOR

Dan Luo E<lt>luodan@email.arizona.eduE<gt>.

=head1 COPYRIGHT

Copyright (c) 2015 luodan

This module is free software; you can redistribute it and/or
modify it under the terms of the GPL (either version 1, or at
your option, any later version) or the Artistic License 2.0.
Refer to LICENSE for the full license text and to DISCLAIMER for
additional warranty disclaimers.

=cut
