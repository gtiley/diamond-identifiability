#!/usr/bin/perl -w

@nloci = (100,500,1000,5000);

for $w (0..3)
{
    system "mkdir $nloci[$w]";
    for $i (0..99)
    {
	$seed = int(rand(1000000000));
        system "mkdir $nloci[$w]/$i";
	$seqPath = "$nloci[$w]/$i/$i.seq";
	$treesPath = "$nloci[$w]/$i/$i.trees";
	$concatPath = "$nloci[$w]/$i/$i.concat";
 	open OUT1,'>', "$nloci[$w]/$i/$i.ctl";
	open FH1,'<',"template.ctl";
	while(<FH1>)
	{
	    $line = $_;
	    chomp $line;
	    $line =~ s/__SEED__/$seed/;
	    $line =~ s/__SEQFILE__/$seqPath/;
	    $line =~ s/__TREEFILE__/$treesPath/;
	    $line =~ s/__CONCATFILE__/$concatPath/;
	    $line =~ s/__NLOCI__/$nloci[$w]/;
	    print OUT1 "$line\n";
	}
	close FH1;
	close OUT1;
    }
}
exit;
