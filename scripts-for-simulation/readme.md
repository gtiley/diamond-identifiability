# scripts-for-simulation

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


