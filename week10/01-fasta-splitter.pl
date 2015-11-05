#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use feature 'say';
use Getopt::Long;
use Pod::Usage;
use Bio::SeqIO;
use Cwd;

my %opts = get_opts();
my @args = @ARGV;

if ($opts{'help'} || $opts{'man'}) {
    pod2usage({
        -exitval => 0,
        -verbose => $opts{'man'} ? 2 : 1
    });
}

my $number = $opts{'number'} || 500;
my $out_dir = $opts{'out_dir'} or getcwd;



use File::Path qw(make_path);
make_path $out_dir;

my $id = 1;
for my $file (@args) {
my $seqIO_object = Bio::SeqIO->new(
                         -file   => $file,
                         -format => 'fasta',
                  );

my $count  = 0;
my $fcount = 1;

my $out_seqIO_obj = Bio::SeqIO->new(
                         -file   => ">$out_dir/$file.$fcount", 
                         -format => 'fasta',
                  );
push my @out, $file.$fcount;
 

while (my $seq_object = $seqIO_object->next_seq){
   $out_seqIO_obj -> write_seq($seq_object);
   $count ++;
   if( $count % $number ==0 ) {
     $fcount ++;
     $out_seqIO_obj = Bio::SeqIO->new(
                         -file   => ">$out_dir/$file.$fcount",
                         -format => 'fasta',
                  );
      push @out, $file.$fcount;
    }
   else { next;}
}

print "$id: $file\n";
for my $outfile (@out){
print STDERR "  -> $out_dir/$outfile\n";
}
$id ++;
}
#print STDERR "$out_dir/$file.$fcount\n";

say "Done.";


# -----------------------------------------------------
sub get_opts {
    my %opts;
    GetOptions(
        \%opts,
        'number=s',
        'out_dir=s',
        'help',
        'man',
    ) or pod2usage(2);

    return %opts;
}

__END__

# --------------------------------------------------

=pod

=head1 NAME

01-fasta-splitter.pl - a script

=head1 SYNOPSIS

  01-fasta-splitter.pl -n 20 -o ~/split file1.fa [file2.fa ...] 

Options (defaults in parentheses):

  --number  The maxmimum number of sequences per file (500)
  --out_dir Output directory (cwd)
  --help    Show brief help and exit
  --man     Show full documentation

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
