#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use feature 'say';
use Getopt::Long;
use Pod::Usage;
use Bio::SeqIO;
use Data::Dumper;

my %opts = get_opts();
my @args = @ARGV;

if ($opts{'help'} || $opts{'man'}) {
    pod2usage({
        -exitval => 0,
        -verbose => $opts{'man'} ? 2 : 1
    });
}

for my $gb_file (@args) {
    my $gb_obj = Bio::SeqIO->new(
                       -file    => $gb_file,
                       -format  => "genbank");
    
    while (my $seq_obj = $gb_obj->next_seq) {
      # print $seq_obj->accession,"\n";
      my %trans = ();
      my $cds_count = 0;
      my $count = 0;
      for my $feature ($seq_obj->get_SeqFeatures){
        if ($feature->primary_tag eq "CDS"){
           $count ++;
           my ($translation) = $feature->get_tag_values("translation");
           #print $count,": ", $translation,"\n";
           $trans{$count} = $translation;
        }
        $cds_count = $count;
      }
      say $seq_obj->accession," has ",$cds_count," CDS";
      #say Dumper(\%trans);
      for my $id ( sort keys %trans) {
        my $cds = $trans{$id};
        say "$id: $cds";
      }
    }
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

03-find-cds.pl - a script

=head1 SYNOPSIS

  03-find-cds.pl rec.gb [rec2.gb ...] 

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
