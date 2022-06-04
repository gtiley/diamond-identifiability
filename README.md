# Diamond Identifiability

### Project management

This is now a Julia project. It has two files `Project.toml` and `Manifest.toml` that keep track of the julia packages needed in some of the scripts.

To work on the project, you can do:

```julia
julia> cd("path/to/project")
pkg> activate .
pkg> instantiate
```

This will install all necessary dependencies with the right versions.

### Is a level-1 4-cycle network identifiable given the set of possible networks?
* data simulated under the multispecies coalescent with introgression (MSci) model (Flouri et al. 2020)
* networks re-estimated using the true toplogies based on unrooted quartets (Solís-Lemus and Ané 2016)
* networks re-estimated using the true topologies based on rooted triples (Yu and Nakhleh, 2015)

### Refereces
Flouri T, Jiao X, Rannala B, Yang Z. 2020. A Bayesian implementation of the multispecies coalescent models with introgression for phylogenomic analysis. *Mol. Biol. Evol.* 37:1211-1223.<br>
<br>
Solís-Lemus C, Ané C. 2016. Inferring phylogeneic neetworks with maximum pseudolikelihood under incomplete lineage sorting. *PLoS Genet.* 12:e1005896.<br>
<br>
Yu Y, Nakhleh L. 2015. A maximum pseudo-likelihood approach for phylogenetic networks. *BMC Genomics* 16:S10.<br>


