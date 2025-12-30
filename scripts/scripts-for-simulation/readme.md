# scripts-for-simulation

## Simulation details and directory structure
Files for simulating gene trees and sequence data with BPP under the multispecies coalescent with introgression model.
* msci-create - using the msci-create tool from bpp to create extended newick strings
  * root1 - input and output files for formatting the nine species networks for root 1
  * root2 - input and output files for formatting the nine species networks for root 2
  * root3 - input and output files for formatting the nine species networks for root 3

General use case of msci-create
```
bpp --msci-create msci-create/root1/d1.in > d1.out
```
More details of formatting extended newick strings for networks are found on the [bpp github](https://github.com/bpp/bpp)

* root1 - template control file used for simulation under root 1 with a small test to check simulations are correct
  * d1 - diamond 1
  * d2 - diamond 2
  * d3 - diamond 3
  * d4 - diamond 4
  * d5 - diamond 5
  * d6 - diamond 6
  * d7 - diamond 7
  * d8 - diamond 8
  * d9 - diamond 9

* root2 - template control file used for simulation under root 2 with a small test to check simulations are correct

* root3 - template control file used for simulation under root 3 with a small test to check simulations are correct

## Helper scripts for facilitating simulation experiments
Helper scripts are currently located in `root3/d1`. They can be copied to other diamonds and used with a little editing.
* `simDriver.pl` - creates a bpp control file for simulation for 100 replicates for 4 different numbers of loci (100, 500, 1000, 5000). This requires a `template.ctl` file to be available within the same directory.
* `runbpp.pl` - Creates a slurm submission script with the correct bpp simulation command for the 400 simulations resulting from `smDriver.pl`. BPP will need to be compiled and the path to the binary provided on line 16. Please edit slurm directives and paths for your system or modify as need be.

## Preparing BPP simulation output for downstream use
`mkphy.pl` is provided in the directory `root3`. After simulations are complete for d1 through d9, `mkphy.pl` will reformat the *.seqs files such that there is a single phylip-formatted alignment per locus. The individual identifiers per species are also removed since we are only simulating a single individual per species. Likewise, the *.trees file is used to create a new tree file per locus with species names as tip labels.
