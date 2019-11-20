#!usr/bin/perl -w
use strict;

my $file_blast = "file_location\\prot.fasta";
open (FIN,$file_blast)||die"Where's the blast file ?";
open (FOUT,">>file_location\\prot.fasta.accnos");

my %seq;
my $key;
while(<FIN>){
	if ($_ =~ /^>(.*)/) {
		$key = $1;
		$seq{$key} = "";
	}
	else {
		$seq{$key} .= $_;
	}
}
#print Dumper %seq;

foreach (keys %seq) {
	if ( $seq{$_} =~ /\*/ ){
		next;
	}
	else {
	print FOUT (">$_\n");
	}
}

close FIN;
close FOUT;

print "\a\a\aFinish!\a\n       \\   |   /\n         ____ \n  ---   /     \\   ---\n       | ~   ~ |\n  ---   \\__O__/   --- \n        /     \\   \n";

