#!/usr/local/bin/perl
# Mike McQuade
# kmer-composition-length.pl
# Finds the k-mer composition of a given length
# in a given string.

# Define the packages to use
use strict;
use warnings;

# Initialize variables
my ($k,$dna,@list);

# Open the file to read
open(my $fh,"<ba3a.txt") or die $!;

# Read in the values from the file
$k = <$fh>;
chomp($k);
$dna = <$fh>;
chomp($dna);

# Iterate through the list to find all kmers contained
# in the string.
for (my $i = 0; $i <= length($dna)-$k; $i++) {
	my $kmer = substr($dna,$i,$k);
	if (!grep $_ eq $kmer, @list) {push @list,$kmer}
}

# Sort list values
@list = sort @list;

# Print out list values in lexicographic order
foreach my $kmer (@list) {print "$kmer\n"}

# Close the file
close($fh) || die "Couldn't close file properly";