#!/usr/bin/perl

use warnings;
use strict;
use utf8;

my $line = 1;
my $lastlem = "";
my $trans = "";

while(<>)
{
	# Yes, this glosses over anything more complicated, but that's all
	# I want right now.	
	if (m!<e([^>]*)><p><l>([^<]*)<s!) {
		if ($1 =~ /r=/) {
			$line++; next;
		}
		$trans = `echo $2|apertium en-es|apertium es-it`;
		print "$line: $2 : $trans\n";
		$lastlem = $2;
		$line++;
	} else {
		$line++;
		next;
	}
}
