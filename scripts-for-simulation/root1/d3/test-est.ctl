seed = 73985
seqfile = test.seqs
Imapfile = spMap.txt
outfile = test.out
mcmcfile = test.mcmc

species&tree = 7 A B C E F G H
                 1 1 1 1 1 1 1
((C,((A,B)t)k[&phi=0.500000,tau-parent=yes])s, ((k[&phi=0.500000,tau-parent=yes],(G,H)x)j,(E,F)w)v)r;
         phase = 0 0 0 0 0 0 0

locusrate = 0
clock = 1
model = hky
       usedata = 1    * 0: no data (prior); 1:seq like
         nloci = 10    * number of datasets in seqfile

*      alphaprior = 1 1 4      * gamma prior for alpha parameter for site rates and ncatG
     cleandata = 0    * remove sites with ambiguity data (1:yes, 0:no)?
*   thetaprior = 3 0.002 e  # inverse gamma(a, b) for theta
    thetaprior = 3 0.002   # inverse gamma(a, b) for theta
      tauprior = 3 0.03    # inverse gamma(a, b) for root tau & Dirichlet(a) for other tau's
      phiprior = 1 1       # beta(a, b) for phi in the MSci model

finetune = 1: .01 .02 .03 .04 .05 .01 .01  # auto (0 or 1): MCMC step lengths
print = 1 0 0 0 0  * print MCMC samples, locusrates(mu_i,nu_i), heredityscalars, genetrees, locusrateparameters
burnin = 20000
sampfreq = 2
nsample = 10000
