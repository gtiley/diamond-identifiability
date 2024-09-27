#!/usr/bin/perl -w
@nloci = ("100","500","1000","5000");                                                                                                     
#1..9
system "mkdir simulationResults";
for $i (1..9)
{
    $diamond = "d" . "$i";
    system "mkdir simulationResults/$diamond";
    for $j (0..3)
    {
	system "mkdir simulationResults/$diamond/$nloci[$j]";
#0..99 replicates
	for $k (0..99)
	{
	    system "mkdir simulationResults/$diamond/$nloci[$j]/$k";
	    system "mkdir simulationResults/$diamond/$nloci[$j]/$k/sequences";
	    system "mkdir simulationResults/$diamond/$nloci[$j]/$k/trees";
	    $n = 0;
	    open FH1,'<',"bpp/$diamond/$nloci[$j]/$k/$k.seq";
	    while (<FH1>)
	    {
		if (/(\d+)\s+(\d+)/)
		{
		    $d1 = $1;
		    $d2 = $2;
		    $n++;
		    open OUT1,'>',"simulationResults/$diamond/$nloci[$j]/$k/sequences/$n.phy";
		    print OUT1 "$d1  $d2\n";
		}
		elsif (/(\S+)\^\S+\s+(.+)/)
		{
		    $tax = $1;
		    $seq = $2;
		    $seq =~ s/\s+//g;
		    print OUT1 "$tax  $seq\n";
		}
	    }
	    close FH1;
	    close OUT1;
	    open FH2,'<',"bpp/$diamond/$nloci[$j]/$k/$k.trees";
	    open OUT2,'>',"simulationResults/$diamond/$nloci[$j]/$k/trees/$k.trees";
	    while (<FH2>)
	    {
		if (/(.+\;)/)
		{
		    $treeString = $1;
		    chomp $treeString;
		    $treeString =~ s/\^\w{1}//g;
		    print OUT2 "$treeString\n";
		}
	    }
	    close OUT2;
	    close FH2;
	}
    }
}
exit;
