# simulations-results
Text files of summarized results for analyze of simulated data.

The simulationResults.\* files have the following columns:
Diamond - The diamond from Fig. 1 {d1,d2,d3,d4,d5,d6,d7,d8,d9}
nTrees - The number of gene trees {100,500,1000,5000}
Replicate - The simulation replicate [1-100]
Net0_lnL - The max pseudo log-likelihood for a species tree 
Net1_lnL - The max pseudo log-likelihood for a network with 1 hybrid edge
Net2_lnL - The max pseudo log-likelihood for a network with 2 hybrid edges
best_h - The best value of h determined by a pseudo log-likelihood increase of two or more when increasing resticulations {0,1,2}
RF_dist - The *hardwired cluster distance* between the inferred network with 1 reticulation and the true network. The value has no meaning about how far from the truth an inferred network is, but 0 indicates the network without branch lengths is identical to the truth.
HBS - The *hybrid bootstrap* proportion. Becuase we are drawing the inferred tree onto the true tree, a value of 1 indicates that the hybrid edge is correct, even if the overal network is wrong. 
gamma - The introgression probability (inheritence probability) estimated for the minor edge when the inferred network with 1 hybrid edge is correct.

* PhyloNet
  * simulationResults.balancedRoot.0.n.txt - root 1 and 10% of gene trees have root+NNI error
  * simulationResults.balancedRoot.0.r.txt - root 1 and 10% of gene trees have root error
  * simulationResults.balancedRoot.1.n.txt - root 1 and 30% of gene trees have root+NNI error
  * simulationResults.balancedRoot.1.r.txt - root 1 and 30% of gene trees have root error
  * simulationResults.balancedRoot.txt - root 1 and true gene trees
  * simulationResults.ladderizedRoot.0.n.txt - root 2 and 10% of gene trees have root+NNI error
  * simulationResults.ladderizedRoot.0.r.txt - root 2 and 10% of gene trees have root error
  * simulationResults.ladderizedRoot.1.n.txt - root 2 and 30% of gene trees have root+NNI error
  * simulationResults.ladderizedRoot.1.r.txt - root 2 and 30% of gene trees have root error
  * simulationResults.ladderizedRoot.txt - root 2 and true gene trees
  * simulationResults.outgroupRoot.0.n.txt - root 3 and 10% of gene trees have root+NNI error
  * simulationResults.outgroupRoot.0.r.txt - root 3 and 10% of gene trees have root error
  * simulationResults.outgroupRoot.1.n.txt - root 3 and 30% of gene trees have root+NNI error
  * simulationResults.outgroupRoot.1.r.txt - root 3 and 30% of gene trees have root error
  * simulationResults.outgroupRoot.txt - - root 3 and true gene trees

* SNaQ
  * same output files as above, but for SNaQ

* aggregated-results
  * All-Simulation-Results.txt - All simulation.\* files combined into one long-formatted table. The method {PhyloNet,SNaQ}, rooting {r1,r2,r3}, and proportion of root and NNI errors (0 = 10% or 1 = 30%) are given.
  * simulations-hcounts.txt - counts of the best number of resticulations across simulation replicates. This helps differntiate false positives versus false ngatives.
  * simulations-percentcorrect.txt - The percentage (number) of simulation replicates that recover the correct network when the number of hybrid edges is 1.



