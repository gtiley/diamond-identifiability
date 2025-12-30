## Script to read a sample of gene trees and do some perturbation:
## - change the root position in a percentage of them
## - perform a random NNI move on a percentage of them
## This file is not meant to be used as a script, but use its parts
## into the simulations. That is, we do not necessarily want
## to do both types of perturbations at the same time.
## Claudia (June 2022)

## Loading packages
using PhyloNetworks
# using PhyloPlots ## just to test the perturbations
using Random, Distributions

## Loading functions
include("gene-tree-perturbations-fns.jl")

## Global parameters
prc = __PWRONG__ ## percentage of gene trees that will be perturbed
globalseed = __GLOBALSEED__ ## global seed

## Read sample of gene trees
treefile = "__INPUTTREES__"
tree = readMultiTopology(treefile)
n = length(tree) ## number of gene trees

## Selecting subsample to be perturbed
Random.seed!(globalseed)
nk = Int(n*prc)
inds = sample(1:n,nk,replace=false)

## Generating specific seeds
seeds = sample(1:5555555,nk,replace=false)

# --------------------------------------
# Changing root to random place
# --------------------------------------

# Specific parameters
out = true ## see gene-tree-perturbations-fns.jl

for i in 1:nk
    changeRandomRoot!(tree[inds[i]], seeds[i], out=out)
end

# Write down the new sample of gene trees (some perturbed)
#rootname = split(treefile, '.')[1]
outfile = "__OUTTREES__-rootchanged.out"
writeMultiTopology(tree, outfile)

# --------------------------------------
# Random NNI move
# --------------------------------------

for i in 1:nk
    randomNNI!(tree[inds[i]], seeds[i])
end

# Write down the new sample of gene trees (some perturbed)
#rootname = split(treefile, '.')[1]
outfile = "__OUTTREES__-nni.out"
writeMultiTopology(tree, outfile)
