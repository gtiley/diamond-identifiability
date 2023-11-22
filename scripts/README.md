## Project management

This is a Julia project. It has two files `Project.toml` and `Manifest.toml` that keep track of the julia packages needed in some of the scripts.

To work on the project, you can do:

```julia
julia> cd("path/to/project")
pkg> activate .
pkg> instantiate
```

This will install all necessary dependencies with the right versions.

## Scripts

- `auxiliary` contains the julia functions to modify gene trees
- `macaulay2` contains the Macaulay2 scripts to get the results of the theorems in the paper
- `phylonet` contains information on how to run PhyloNet