#!/usr/bin/perl

open BIBTEX, "@ARGV[0]" or die "file error.\n";

$opened = 0;
while(<BIBTEX>) {
	if(/@([A-Za-z]+){ *(.*),/) {
		$cite = $2;
		$type = $1;
		$opened = 1;
	}
	if($opened) {
		if(/\s*([a-zA-Z]+)\s*=\s*({|\")(.*)(}|\"),/) {
			${$1} = $3;
		}
	}
	if(/}$/) {
		$type = uc($type);
		if("$type" eq "BOOK") {
			print "\"$cite\" - '$author'\n";
			print "$title -- $year\n\n"
		}
		if("$type" eq "MISC") {
			print "\"$cite\" - '$howpublished'\n";
			print "$title\n\n";
		}
		if("$type" eq "INPROCEEDINGS") {
			print "\"$cite\" - '$title' - \"$author\"\n";
			print "'$booktitle'\n\n";
		}
		if("$type" eq "ARTICLE") {
			print "\"$cite\" - '$title' - \"$author\"\n";
			print "$journal\n\n";
		}
		if("$type" eq "TECHREPORT") {
			print "\"$cite\" - '$title' - \"$author\"\n";
			print "$year\n\n";
		}
		$opened = 0;

		$title = "";
		$author = "";
		$booktitle = "";
		$cite = "";
		$howpublished = "";
		$year = "";
	}
}

close BIBTEX;
