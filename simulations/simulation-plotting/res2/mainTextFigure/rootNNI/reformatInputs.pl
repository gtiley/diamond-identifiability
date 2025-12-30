#!/usr/bin/perl -w

@diamonds = ("d1","d2","d3","d4","d5","d6","d7","d8","d9");
@method = ("snaq","phylonet");
@roots = ("balancedRoot","ladderizedRoot","outgroupRoot");
@rootAbbr = ("r1","r2","r3");
@methodAbbr = ("SNaQ","InferNetwork_MPL");
#@nTrees = ("100","500","1000","5000");



for $d (0..8)
{
	for $r (0..2)
	{
		open OUT1,'>',"$diamonds[$d].$rootAbbr[$r].txt";
		print OUT1 "Method\tnTrees\txPos\tFoundOneEdge\tCorrectNetwork\tHasHybridEdge\n";
		for $m (0..1)
		{
			if ($m == 0)
			{
				$xpos = 0.9;
			}
			if ($m == 1)
			{
				$xpos = 1.1;
			}
			open FH1,'<',"$method[$m].$roots[$r].0.nni.resultForPlotting.txt";
			while (<FH1>)
			{
				$line = $_;
				chomp $line;
				@temp = ();
				@temp = split(/\t/,$line);
				if ($temp[0] eq $diamonds[$d])
				{
					print OUT1 "$methodAbbr[$m]\t$temp[1]\t$xpos\t$temp[3]\t$temp[4]\t$temp[5]\n";
					$xpos = $xpos + 1;
				}
			}
			close FH1;
		}
		close OUT1;	
	}
}
