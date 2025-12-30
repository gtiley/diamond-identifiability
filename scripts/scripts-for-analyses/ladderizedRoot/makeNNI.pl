#!/usr/bin/perl -w
@nloci = ("100","500","1000","5000");
@pwrong = ("0.1","0.3");
#1..9
for $i (1..9)
{
    $diamond = "d" . "$i";
    for $j (0..3)
    {
        for $k (0..99)
        {
	    $inputTrees = "simulationResults/$diamond/$nloci[$j]/$k/trees/$k.trees";
            for $l (0..1)
            {
		$outputTrees = "simulationResults/$diamond/$nloci[$j]/$k/trees/$k-$l";
                $gseed = int(rand(1000000000));
		open OUT1,'>',"$i.$j.$k.$l.nni.jl";
		open FH1,'<',"gene-tree-perturbations.template.jl";
		while (<FH1>)
		{
			$line = $_;
			chomp $line;
			$line =~ s/__INPUTTREES__/$inputTrees/;
			$line =~ s/__OUTTREES__/$outputTrees/;
			$line =~ s/__PWRONG__/$pwrong[$l]/;
			$line =~ s/__GLOBALSEED__/$gseed/;
			print OUT1 "$line\n";
		}
		close FH1;
		close OUT1;

		open OUT1,'>',"$diamond.$nloci[$j].$k.$l.nni.sh";
                print OUT1 "#!/bin/bash\n#SBATCH --job-name=$diamond.$nloci[$j].$k.$l\n#SBATCH --output=$diamond.$nloci[$j].$k.$l.log\n#SBATCH --mail-user=g.tiley\@kew.org\n#SBATCH --mail-type=FAIL\n#SBATCH --time=24:00:00\n#SBATCH --mem-per-cpu=1000M\n#SBATCH --nodes=1\n#SBATCH --ntasks=1\n#SBATCH --cpus-per-task=1\n#SBATCH --partition=short\ncd /data/users_area/gti10kg/badDiamond/balancedRoot\n";
                print OUT1 "/data/users_area/gti10kg/programs/julia-1.6.5/bin/julia $i.$j.$k.$l.nni.jl\n";
                close OUT1;
                system "sbatch $diamond.$nloci[$j].$k.$l.nni.sh";
	    }
	}
    }
}
exit;
	    

