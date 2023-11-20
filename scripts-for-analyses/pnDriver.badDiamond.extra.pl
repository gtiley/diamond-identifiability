#!/usr/bin/perl -w

@rooting = ("balancedRoot","ladderizedRoot","outgroupRoot");
@diamond = ("d1","d2","d3","d4","d5","d6","d7","d8","d9");
@nloci = ("100","500","1000","5000");
@error = ("rootchanged","nni");

for $i (2..(scalar(@rooting)-1))
{
    #system "mkdir $rooting[$i]/snaq";
    for $j (0..(scalar(@diamond)-1))
    {
#	system "mkdir $rooting[$i]/snaq/$diamond[$j]";
	for $k (0..(scalar(@nloci)-1))
	{
#	    system "mkdir $rooting[$i]/snaq/$diamond[$j]/$nloci[$k]";
	    for $l (0..99)
	    {
		#system "mkdir $rooting[$i]/snaq/$diamond[$j]/$nloci[$k]/$l";
		for $m (0..1)
		{
			for $n (0..1)
			{
				open OUT1,'>',"$rooting[$i]/snaq/$diamond[$j]/$nloci[$k]/$l/pn.$rooting[$i].$diamond[$j].$nloci[$k].$l.$m.$n.jl";
				open FH1,'<',"pn.true.jl.extra.template";
				$r1 = int(rand(100000000000));
				$r2 = int(rand(100000000000));
				$r3 = int(rand(100000000000));
				while (<FH1>)
				{
		    			$line = $_;
		    			chomp $line;
		    			$line =~ s/__ROOTING__/$rooting[$i]/g;
		    			$line =~ s/__DIAMOND__/$diamond[$j]/g;
		    			$line =~ s/__NLOCI__/$nloci[$k]/g;
		    			$line =~ s/__I__/$l/g;
		    			$line =~ s/__PWRONG__/$m/g;
					$line =~ s/__ERROR__/$error[$n]/g;	
		    			$line =~ s/\#$diamond[$j]//g;
		    			$line =~ s/__R1__/$r1/;
		    			$line =~ s/__R2__/$r2/;
		    			$line =~ s/__R3__/$r3/;
		    			if ($line !~ m/^\#.+/)
					{
						print OUT1 "$line\n";
		    			}
				}
				open OUT1,'>',"$rooting[$i]/snaq/$diamond[$j]/$nloci[$k]/$l/pn.$rooting[$i].$diamond[$j].$nloci[$k].$l.$m.$n.sh";
				print OUT1 "#!/bin/bash\n#SBATCH --job-name=$rooting[$i].$diamond[$j].$nloci[$k].$l.$m.$n\n#SBATCH --output=$rooting[$i].$diamond[$j].$nloci[$k].$l.$m.$n.log\n#SBATCH --mail-user=g.tiley\@kew.org\n#SBATCH --mail-type=FAIL\n#SBATCH --time=24:00:00\n#SBATCH --mem-per-cpu=1000M\n#SBATCH --nodes=1\n#SBATCH --ntasks=1\n#SBATCH --cpus-per-task=4\n#SBATCH --partition=short\ncd /data/users_area/gti10kg/badDiamond/$rooting[$i]/snaq/$diamond[$j]/$nloci[$k]/$l\n";
				print OUT1 "module load gcc\n";
				print OUT1 "/data/users_area/gti10kg/programs/julia-1.6.5/bin/julia pn.$rooting[$i].$diamond[$j].$nloci[$k].$l.$m.$n.jl\n";
				close OUT1;
				system "sbatch $rooting[$i]/snaq/$diamond[$j]/$nloci[$k]/$l/pn.$rooting[$i].$diamond[$j].$nloci[$k].$l.$m.$n.sh";
			}
		}
	    }
	}
    }
}
