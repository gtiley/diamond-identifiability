# Mapping of quartets from one network to another network

## Mapping N_right to N_down

```julia
mapNright2Ndown([0,0,2,2])
mapNright2Ndown([0,1,2,1])
mapNright2Ndown([0,1,1,2])
mapNright2Ndown([0,2,2,0])
mapNright2Ndown([0,2,1,1])
mapNright2Ndown([0,2,0,2])
mapNright2Ndown([1,0,2,1])
mapNright2Ndown([1,0,1,2])
mapNright2Ndown([1,1,2,0])
mapNright2Ndown([1,1,0,2])
mapNright2Ndown([1,2,1,0])
mapNright2Ndown([1,2,0,1])
mapNright2Ndown([2,0,2,0])
mapNright2Ndown([2,0,1,1])
mapNright2Ndown([2,0,0,2])
mapNright2Ndown([2,1,1,0])
mapNright2Ndown([2,1,0,1])
mapNright2Ndown([2,2,0,0])
```

Results:

```julia
julia> mapNright2Ndown([0,0,2,2])
4-element Vector{Int64}:
 2
 0
 2
 0

julia> mapNright2Ndown([0,1,2,1])
4-element Vector{Int64}:
 2
 0
 1
 1

julia> mapNright2Ndown([0,1,1,2])
4-element Vector{Int64}:
 1
 0
 2
 1

julia> mapNright2Ndown([0,2,2,0])
4-element Vector{Int64}:
 2
 0
 0
 2

julia> mapNright2Ndown([0,2,1,1])
4-element Vector{Int64}:
 1
 0
 1
 2

julia> mapNright2Ndown([0,2,0,2])
4-element Vector{Int64}:
 0
 0
 2
 2

julia> mapNright2Ndown([1,0,2,1])
4-element Vector{Int64}:
 2
 1
 1
 0

julia> mapNright2Ndown([1,0,1,2])
4-element Vector{Int64}:
 1
 1
 2
 0

julia> mapNright2Ndown([1,1,2,0])
4-element Vector{Int64}:
 2
 1
 0
 1

julia> mapNright2Ndown([1,1,0,2])
4-element Vector{Int64}:
 0
 1
 2
 1

julia> mapNright2Ndown([1,2,1,0])
4-element Vector{Int64}:
 1
 1
 0
 2

julia> mapNright2Ndown([1,2,0,1])
4-element Vector{Int64}:
 0
 1
 1
 2

julia> mapNright2Ndown([2,0,2,0])
4-element Vector{Int64}:
 2
 2
 0
 0

julia> mapNright2Ndown([2,0,1,1])
4-element Vector{Int64}:
 1
 2
 1
 0

julia> mapNright2Ndown([2,0,0,2])
4-element Vector{Int64}:
 0
 2
 2
 0

julia> mapNright2Ndown([2,1,1,0])
4-element Vector{Int64}:
 1
 2
 0
 1

julia> mapNright2Ndown([2,1,0,1])
4-element Vector{Int64}:
 0
 2
 1
 1

julia> mapNright2Ndown([2,2,0,0])
4-element Vector{Int64}:
 0
 2
 0
 2
```