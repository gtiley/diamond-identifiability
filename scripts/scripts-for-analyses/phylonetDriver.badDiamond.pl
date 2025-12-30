#!/usr/bin/perl -w

@rooting = ("balancedRoot","ladderizedRoot","outgroupRoot");
@diamond = ("d1","d2","d3","d4","d5","d6","d7","d8","d9");
@nloci = ("100","500","1000","5000");

for $i (0..(scalar(@rooting)-3))
{
    system "mkdir $rooting[$i]/phylonet";
    for $j (0..(scalar(@diamond)-4))
    {
	system "mkdir $rooting[$i]/phylonet/$diamond[$j]";
	for $k (0..(scalar(@nloci)-1))
	{
	    system "mkdir $rooting[$i]/phylonet/$diamond[$j]/$nloci[$k]";
	    for $l (0..99)
	    {
		system "mkdir $rooting[$i]/phylonet/$diamond[$j]/$nloci[$k]/$l";
		open OUT1,'>',"$rooting[$i]/phylonet/$diamond[$j]/$nloci[$k]/$l/phylonet.$rooting[$i].$diamond[$j].$nloci[$k].$l.sh";
		print OUT1 "#!/bin/bash\n#SBATCH --job-name=phylonet.$rooting[$i].$diamond[$j].$nloci[$k].$l\n#SBATCH --output=phylonet.$rooting[$i].$diamond[$j].$nloci[$k].$l.log\n#SBATCH --mail-user=g.tiley\@kew.org\n#SBATCH --mail-type=FAIL\n#SBATCH --time=24:00:00\n#SBATCH --mem-per-cpu=4000M\n#SBATCH --nodes=1\n#SBATCH --ntasks=1\n#SBATCH --cpus-per-task=4\n#SBATCH --partition=short\ncd /data/users_area/gti10kg/badDiamond/$rooting[$i]/phylonet/$diamond[$j]/$nloci[$k]/$l\n";
		#/data/users_area/gti10kg/badDiamond/balancedRoot/simulationResults/d9/5000/27/nexus
		#27.phylonet-0.nex
		print OUT1 "java -jar /data/users_area/gti10kg/programs/phylonet-3.8.3/PhyloNet.jar /data/users_area/gti10kg/badDiamond/$rooting[$i]/simulationResults/$diamond[$j]/$nloci[$k]/$l/nexus/$l.phylonet-0.nex > mpl.0.out\n";
		print OUT1 "java -jar /data/users_area/gti10kg/programs/phylonet-3.8.3/PhyloNet.jar /data/users_area/gti10kg/badDiamond/$rooting[$i]/simulationResults/$diamond[$j]/$nloci[$k]/$l/nexus/$l.phylonet-1.nex > mpl.1.out\n";
		print OUT1 "java -jar /data/users_area/gti10kg/programs/phylonet-3.8.3/PhyloNet.jar /data/users_area/gti10kg/badDiamond/$rooting[$i]/simulationResults/$diamond[$j]/$nloci[$k]/$l/nexus/$l.phylonet-2.nex > mpl.2.out\n";
		close OUT1;
		system "sbatch $rooting[$i]/phylonet/$diamond[$j]/$nloci[$k]/$l/phylonet.$rooting[$i].$diamond[$j].$nloci[$k].$l.sh";
	    }
	}
    }
}
