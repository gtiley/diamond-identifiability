## Functions to pertube a given gene tree
## - change the root position
## - perform a random NNI move
## Necessary file for gene-tree-perturbations.jl
## Claudia (June 2022)

## function to change root of gene tree `tre`
## to a random position
## `s` is the random seed
## out=true (default): we change the root based on a taxon outgroup
## out=false: we change the root to any edge (so whole clades can be outgroup) 
function changeRandomRoot!(tre, s::Int; out=true::Bool)
    Random.seed!(s)
    if out
        tips = tipLabels(tre)
        n = length(tips)
        ind = sample(1:n,1)
        rootatnode!(tre,tips[ind][1])
    else
        ind = sample(1:length(tre.edge),1)
        rootonedge!(tre,ind[1], index=true)
    end
end

## function to perform a random NN move
## on the gene tree `tre`
## `s` is the random seed
function randomNNI!(tre, s::Int)
    Random.seed!(s)
    intedge = tre.edge[Bool.([e.istIdentifiable for e in tre.edge])]
    n = length(intedge)
    ind = sample(1:n,1)
    nni!(tre, intedge[ind][1])
end