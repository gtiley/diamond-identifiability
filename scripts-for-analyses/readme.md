# scripts-for-analyses

Auxillary scripts for analyzing simulated gene trees with SNaQ and PhyloNet. There are three directories as well as some top-level scripts for managing analyses and collecting results. 

* balancedRoot - scripts for creating input tree files with root 1
  * formatPhylonet.pl - creates a PhyloNet-formatted nexus file with provided gene trees
  * gene-tree-pertubations.template.jl - uses functions from Phylonetwork to reroot trees and perform an NNI move
  * makeNNI.pl - uses the gene-tree-perturbations.template.jl script to indroduce a random root or random root and NNI error into 10% and 30% of the simulated gene trees
  * mkphy.pl - creates individual phylip files from BPP output sequences and creates a file of simulated trees for analysis with SNaQ

* ladderizedRoot - scripts for creating input tree files with root 2
  * replicated from above

* outgroupRoot - scripts for creating input tree files with root 3
  * replicated from above

phylonetDriver.badDiamond.extra.pl - Distributes PhyloNet analyses of gene trees with error after creating nexus-formatted input files with `formatPhylonet.pl`.
phylonetDriver.badDiamond.pl - Distributes PhyloNet analyses of true gene trees after creating nexus-formatted input files with `formatPhylonet.pl`.
* pn.true.jl.extra.template - The Julia script with all options for SNaQ analyses when given gene trees with errors. Called by `pnDriver.badDiamond.extra.pl`. This is separate from the other Julia script `pn.true.jl.template` since the analyses of gene trees with errors was introduced after the analyses of true gene trees and required extra parameters to specify the proportion of rooting and NNI errors. 
* pn.true.jl.template - The Julia script with all options for SNaQ analyses when given true gene trees. Called by `pnDriver.badDiamond.pl`.
* pnDriver.badDiamond.extra.pl - Uses `pn.true.jl.extra.template` to distribute analyses of simulation replicates after adding errors with `makeNNI.pl`.
* pnDriver.badDiamond.pl - Uses `pn.true.jl.extra.template` to distribute analyses of simulation replicates.
processNetworks.phylonet.extra.pl - Generates summary statistics from PhyloNet results across simulation replicates of gene trees with error.
processNetworks.phylonet.pl - Generates summary statistics from PhyloNet results across simulation replicates of true gene trees.
processNetworks.snaq.extra.pl - Generates summary statistics from SNaQ results across simulation replicates of gene trees with error.
processNetworks.snaq.pl - Generates summary statistics from SNaQ results across simulation replicates of true gene trees.


