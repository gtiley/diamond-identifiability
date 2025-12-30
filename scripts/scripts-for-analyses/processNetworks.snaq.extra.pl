#!/usr/bin/perl -w

#BSn, BSe, BSc, BSgam, BSedgenum = hybridBootstrapSupport(estimatedNetowrk, trueNetwork);
#@show

$edgesCounted = 1;

@rooting = ("balancedRoot","ladderizedRoot","outgroupRoot");
@diamond = ("d1","d2","d3","d4","d5","d6","d7","d8","d9");
@ntrees = ("100","500","1000","5000");
@error = ("rootchanged","nni");

for $w (0..2)
{
	for $x (0..1)
	{
	for $y (0..1)
	{
	if ($edgesCounted == 1)
	{
		open OUT9,'>',"simulationResults.$rooting[$w].$x.$error[$y].txt";
		print OUT9 "Diamond\tnTrees\tReplicate\tNet0_lnL\tNet1_lnL\tNet2_lnL\tbest_h\tRF_dist\tHBS\tgamma\n";
	}
	for $i (0..8)
	{
		for $j (0..3)
		{
	    		print "### $i $j ###\n";
			for $k (0..99)
			{
				%rank = ();
				$minlnL = 1000000000;
				$minh = 9;
				$match = 9;
				$bsp = 0;
				$gamma = "NA";
				for $l (0..2)
				{
					#0.net0.true.snaq.out				
					#0-0-nni.net0.true.snaq.out
					$inputFile = "$rooting[$w]". "/snaq/" . "$diamond[$i]" . "/" . "$ntrees[$j]" . "/" . "$k" . "/" . "$k-$x-$error[$y]" . "." . "net" . "$l" . ".true.snaq.out";			
					#(B:3.984456752112088,(A:9.813435816893586,(D:9.683190356328986,(C:5.5936877893565695,#H15:0.3033217327480923::0.49950486220971546):4.471159148542096):4.34239795790208):8.122770224908178,(E:0.0)#H15:0.33273295389560537::0.5004951377902845); -Ploglik = 282.8037171234896
					open FH1,'<',"$inputFile";
					while (<FH1>)
					{
						if (/(.+;)\s+\-Ploglik\s+\=\s+(\S+)/)
						{
							$net = $1;
							$lnL = $2;
							$net =~ s/\s+//g;
							$rank{$l} = $lnL;
							if ($lnL < ($minlnL-2))
							{
								$minlnL = $lnL;
								$minh = $l;
							}
							if ($l == 1)
							{
								$hybridEdge = "";
								if ($net =~ m/\S+\)(\#H\d+)\:\S+/)
								{
									$hybridEdge = $1;
								}
								open OUT1,'>',"$rooting[$w]/snaq/$diamond[$i]/$ntrees[$j]/$k/$i.$j.$k-$x-$error[$y].netStats.jl";
								print OUT1 "using PhyloNetworks\n";
#								#print OUT1 "using CSV\n";
								if ($i == 0)
								{
									print OUT1 "trueNet = readTopology(\"(($hybridEdge,(C,D)),((E,F),(((A,B))$hybridEdge,(G,H))));\")\n";
								}
								if ($i == 1)
                                                                {
                                                                        print OUT1 "trueNet = readTopology(\"(($hybridEdge,(C,D)),((E,F),((A)$hybridEdge,(G,H))));\")\n";
                                                                }
								if ($i == 2)
                                                                {
                                                                        print OUT1 "trueNet = readTopology(\"(($hybridEdge,C),((E,F),(((A,B))$hybridEdge,(G,H))));\")\n";
                                                                }
								if ($i == 3)
                                                                {
                                                                        print OUT1 "trueNet = readTopology(\"(($hybridEdge,(C,D)),(E,(((A,B))$hybridEdge,(G,H))));\")\n";
                                                                }
								if ($i == 4)
                                                                {
                                                                        print OUT1 "trueNet = readTopology(\"(($hybridEdge,(C,D)),((E,F),(((A,B))$hybridEdge,G)));\")\n";
                                                                }
								if ($i == 5)
                                                                {
                                                                        print OUT1 "trueNet = readTopology(\"(($hybridEdge,C),((E,F),((A)$hybridEdge,(G,H))));\")\n";
                                                                }
								if ($i == 6)
                                                                {
                                                                        print OUT1 "trueNet = readTopology(\"(($hybridEdge,C),(E,(((A,B))$hybridEdge,(G,H))));\")\n";
                                                                }
								if ($i == 7)
                                                                {
                                                                        print OUT1 "trueNet = readTopology(\"(($hybridEdge,(C,D)),(E,(((A,B))$hybridEdge,G)));\")\n";
                                                                }
								if ($i == 8)
                                                                {
                                                                        print OUT1 "trueNet = readTopology(\"(($hybridEdge,(C,D)),((E,F),((A)$hybridEdge,G)));\")\n";
                                                                }
								print OUT1 "estNet = readTopology(\"$net\")\n";
								print OUT1 "try\n";
								print OUT1 "\trootatnode!(estNet, \"C\")\n";
								print OUT1 "catch\n";
								print OUT1 "\tprintln(\"Rooting of estimated network not possible\")\n";
								print OUT1 "end\n";
								print OUT1 "rootatnode!(trueNet, \"C\")\n";
								print OUT1 "d = hardwiredClusterDistance(estNet, trueNet, true)\n";
								print OUT1 "println(\"Hardwired Cluster Distance = \", d)\n";
								print OUT1 "estArray = [estNet]\n";
								print OUT1 "BSn, BSe, BSc, BSgam, BSedgenum = hybridBootstrapSupport(estArray, trueNet)\n";
								print OUT1 "println(\"Begin Bootstrap nodes\")\n";
								print OUT1 "println(BSn)\n";
								print OUT1 "println(\"End Bootstrap nodes\")\n";
								print OUT1 "println(\"Begin Bootstrap edges\")\n";
								print OUT1 "println(BSe)\n";
								print OUT1 "println(\"End Bootstrap edges\")\n";
								print OUT1 "println(\"Begin Adjacency Matrix\")\n";
								print OUT1 "println(BSc)\n";
								print OUT1 "println(\"End Adjacency Matrix\")\n";
								print OUT1 "println(\"gamma = \", BSgam)\n";
								print OUT1 "println(\"edge number = \", BSedgenum)\n";
								close OUT1;
								if ($edgesCounted == 0)
								{
									open OUT2,'>',"$rooting[$w]/snaq/$diamond[$i]/$ntrees[$j]/$k/netStats.$k-$x-$error[$y].sh";
									print OUT2 "#!/bin/bash\n#SBATCH --mail-user=g.tiley\@kew.org\n#SBATCH --mail-type=FAIL\n#SBATCH --time=24:00:00\n#SBATCH --mem-per-cpu=1000M\n#SBATCH --nodes=1\n#SBATCH --ntasks=1\n#SBATCH --cpus-per-task=1\n#SBATCH --partition=short\n";
									print OUT2 "module load gcc\n";
									print OUT2 "cd $rooting[$w]/snaq/$diamond[$i]/$ntrees[$j]/$k/\n";
									print OUT2 "/data/users_area/gti10kg/programs/julia-1.6.5/bin/julia $i.$j.$k-$x-$error[$y].netStats.jl  > $i.$j.$k-$x-$error[$y].netStats.txt\n";
									close OUT2;
									system "sbatch $rooting[$w]/snaq/$diamond[$i]/$ntrees[$j]/$k/netStats.$k-$x-$error[$y].sh";
								}
								elsif ($edgesCounted == 1)
								{
									open FH2,'<',"$rooting[$w]/snaq/$diamond[$i]/$ntrees[$j]/$k/$i.$j.$k-$x-$error[$y].netStats.txt";
									$tableCorrect = 0;
									while(<FH2>)
									{
										$line = $_;
										chomp $line;
										if ($line =~ m/Hardwired\s+Cluster\s+Distance\s+=\s+(\d+)/)
										{
											$match = $1;
										}
#   1 │ H7             6           1       9      100.0        0.0              0.0              0.0                  100.0
										if ($line =~ m/.+H\d+.+/)
										{	
											@temp = ();
											@temp = split(/\s+/,$line);
											if (scalar(@temp) == 11)
											{
												if ($temp[10] eq "100.0")
												{
													$bsp = 1;
												}
												$tableCorrect = 1;
											}

										}
#gamma = [0.5110870635637355 0.48891293643626454]
										if ($line =~ m/gamma\s+\=\s+\[(\d+\.\d+)\s+(\d+\.\d+)\]/)
										{
											$g1 = $1;
											$g2 = $2;
											if ($g1 != 0.0)
											{
												if ($g1 < $g2)
												{
													$gamma = $g1;
												}
												elsif ($g2 <= $g1)
												{
													$gamma = $g2;
												}
											}
										}
									}
									close FH2;
									if ($tableCorrect == 0)
									{
										print "Problem - Check output for $w $i $j $k\n";
									}
								}
							}
						}
					}
				}
				if ($edgesCounted == 1)
				{
					print OUT9 "$diamond[$i]\t$ntrees[$j]\t$k\t$rank{0}\t$rank{1}\t$rank{2}\t$minh\t$match\t$bsp\t$gamma\n";
				}
			}
		}
	}
	close OUT9;
	}
	}
}
exit;
