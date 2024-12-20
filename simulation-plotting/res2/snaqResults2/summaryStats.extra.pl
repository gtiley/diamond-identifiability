#!/usr/bin/perl -w

@rooting = ("balancedRoot","ladderizedRoot","outgroupRoot");
@diamonds = ("d1","d2","d3","d4","d5","d6","d7","d8","d9");
@ntrees = ("100","500","1000","5000");
@perror = ("0","1");
@terror = ("rootchanged","nni");

for $i (0..2)
{
	for $j (0..1)
	{
	for $k (0..1)
	{
	%res = ();
	@header = ();
	open FH1,'<',"simulationResults.$rooting[$i].$perror[$j].$terror[$k].txt";
	while(<FH1>)
	{
		$line = $_;
		chomp $line;
		if ($line =~ m/^Diamond/)
		{
			@header = split(/\t/, $line);
		}
		else
		{
			@temp = ();
			@temp = split(/\t/, $line);
			if (! exists $res{$temp[0]}{$temp[1]}{$header[6]})
			{
				if ($temp[6] != 1)
				{
					$temp[6] = 0;
				}
				$res{$temp[0]}{$temp[1]}{$header[6]} = $temp[6];
				if ($temp[7] > 0)
				{
					$temp[7] = 1;
				}
				$res{$temp[0]}{$temp[1]}{$header[7]} = $temp[7];
				$res{$temp[0]}{$temp[1]}{$header[8]} = $temp[8];
			}
			elsif (exists $res{$temp[0]}{$temp[1]}{$header[6]})
			{
				if ($temp[6] != 1)
				{
					$temp[6] = 0;
				}
				$res{$temp[0]}{$temp[1]}{$header[6]} = $res{$temp[0]}{$temp[1]}{$header[6]} + $temp[6];
				if ($temp[7] > 0)
				{
					$temp[7] = 1;
				}
				$res{$temp[0]}{$temp[1]}{$header[7]} = $res{$temp[0]}{$temp[1]}{$header[7]} + $temp[7];
				$res{$temp[0]}{$temp[1]}{$header[8]} = $res{$temp[0]}{$temp[1]}{$header[8]} + $temp[8];
			}
		}
	}
	close FH1;
	open OUT1,'>',"$rooting[$i].$perror[$j].$terror[$k].resultForPlotting.txt";
	print OUT1 "Diamond\tnTrees\txPos\tFoundOneEdge\tCorrectNetwork\tHasHybridEdge\n";
	$xp = 0;
	for $j (0..8)
	{
		$xp = $j + 1 + 0.1;
		for $k (0..3)
		{
			$foe = $res{$diamonds[$j]}{$ntrees[$k]}{$header[6]};
			$pc = 100 - $res{$diamonds[$j]}{$ntrees[$k]}{$header[7]};
			$hhe = $res{$diamonds[$j]}{$ntrees[$k]}{$header[8]};
			if ($k == 0)
			{
				$xp = $xp - 0.4;
			}
			elsif ($k > 0)
			{
				$xp = $xp + 0.2;
			}
			print OUT1 "$diamonds[$j]\t$ntrees[$k]\t$xp\t$foe\t$pc\t$hhe\n";	
		}
	}
	close OUT1;
	}
	}
}
exit;
