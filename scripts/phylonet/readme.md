# Running PhyloNet

1. Download PhyloNet from [here](https://bioinfocs.rice.edu/phylonet). We are using version 3.8.2
    - We get `PhyloNet.jar`
2. The julia script `phylonet-nexus.jl` creates the input NEXUS file for PhyloNet from a texfile that contains the list of gene trees. The NEXUS file fits the pseudolikelihood method in PhyloNet [`InferNetwork_MPL`](https://wiki.rice.edu/confluence/display/PHYLONET/InferNetwork_MPL) with 1 hybridization
    - Input to script: textfile with gene trees, say `sim1.txt`
    - Output: PhyloNet NEXUS file with same rootname: `sim1-phylonet.nex`
3. To run PhyloNet, you need to type in the terminal:
```
java -jar $PHYLONET PATH/jar/PhyloNet.jar sim1-phylonet.nex > sim1-phylonet.out
```