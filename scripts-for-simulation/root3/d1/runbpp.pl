#!/usr/bin/perl -w

$diamond = "d1";

@nloci = (100,500,1000,5000);

$submitfile = "$diamond". ".bpp.sh";
open OUT1,'>',"$submitfile";
print OUT1 "#!/bin/bash\n#SBATCH --job-name=$diamond.bpp\n#SBATCH --output=$diamond.bpp.log\n#SBATCH --mail-user=<user_email>\n#SBATCH --mail-type=FAIL\n#SBATCH --time=24:00:00\n#SBATCH --mem-per-cpu=1000M\n#SBATCH --nodes=1\n#SBATCH --ntasks=1\n#SBATCH --cpus-per-task=1\n#SBATCH --partition=short\ncd <path_to_dir>/badDiamond/balancedRoot/$diamond\n";

for $w (0..3)
{
    for $i (0..99)
    {
	$ctlFile = "$i" . ".ctl";
	print OUT1 "<path_to_bpp>/bpp-4.4.1-linux-x86_64/bin/bpp --simulate $nloci[$w]/$i/$ctlFile\n"; 
    }
}
close OUT1;
#system "sbatch $nloci[$w]/$i/$submitfile";
exit;
