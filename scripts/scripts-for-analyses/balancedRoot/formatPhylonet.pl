#!/usr/bin/perl -w
use strict;
my $command = "InferNetwork_MPL";
#my $numhyb = 1;
my $netret = 1;
my $numproc = 4;
my $numruns = 10;

my @diamonds = ("d1","d2","d3","d4","d5","d6","d7","d8","d9");
my @nloci = ("100","500","1000","5000");

for my $i (0..(scalar(@diamonds)-1))
{
	for my $j (0..(scalar(@nloci)-1))
	{
		for my $k (0..99)
		{	
			#/data/users_area/gti10kg/badDiamond/outgroupRoot/simulationResults/d9/5000/3/trees
			my $treefile = "simulationResults/$diamonds[$i]/$nloci[$j]/$k/trees/$k-0-nni.out";
			#system "mkdir simulationResults/$diamonds[$i]/$nloci[$j]/$k/nexus";
			for my $numhyb (0..2)
			{
				open OUT1,'>',"simulationResults/$diamonds[$i]/$nloci[$j]/$k/nexus/$k-0-n.phylonet-$numhyb.nex";
				print OUT1 "#NEXUS\n\nBEGIN TREES;\n\n";
				open FH1,'<',"$treefile";
				my $gti = 0;
				while (<FH1>)
				{
					my $treeString = $_;
					chomp $treeString;
					my $nexString = "Tree gt" . "$gti" . "= " . "$treeString";
					print OUT1 "$nexString\n";
					$gti++;	
				}
				close FH1;
				print OUT1 "\nEND;\n\n\n";
				print OUT1 "BEGIN PHYLONET;\n\n";
				print OUT1 "$command (all) $numhyb -x $numruns -n $netret -pl $numproc;";
				print OUT1 "\n\nEND;";
				close OUT1;
			}
		}
	}
}
exit;
