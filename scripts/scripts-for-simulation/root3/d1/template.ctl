seed = __SEED__
seqfile = __SEQFILE__
treefile = __TREEFILE__
Imapfile = spMap.txt
concatfile = __CONCATFILE__
modelparafile = modelparams.txt

species&tree = 8 A B C D E F G H
                 1 1 1 1 1 1 1 1
((C #0.01,D #0.01)u:0.01 #0.01, (((A #0.01,B #0.01)t:0.01 #0.01)k[&phi=0.500000,tau-parent=yes] :0.015 #0.01,((k[&phi=0.500000,tau-parent=yes] :0.015 #0.01,(G #0.01,H #0.01)x:0.01 #0.01)j:0.015 #0.01,(E #0.01,F #0.01)w:0.01 #0.01)v:0.02 #0.01)s:0.03 #0.01)r:0.04 #0.01;
         phase = 0 0 0 0 0 0 0 0
loci&length = __NLOCI__ 1000
locusrate = 0
clock = 1
model = 7
Qrates = 1 3 1 1 1 1 3
basefreqs = 1 0.3 0.2 0.3 0.2
alpha_siterate = 1 0.6 4

