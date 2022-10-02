# Mapping of quartets from one network to another network

Using `quartet-map.jl`.

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

## Mapping N_left to N_down

```julia
mapNleft2Ndown([0,0,2,2])
mapNleft2Ndown([0,1,2,1])
mapNleft2Ndown([0,1,1,2])
mapNleft2Ndown([0,2,2,0])
mapNleft2Ndown([0,2,1,1])
mapNleft2Ndown([0,2,0,2])
mapNleft2Ndown([1,0,2,1])
mapNleft2Ndown([1,0,1,2])
mapNleft2Ndown([1,1,2,0])
mapNleft2Ndown([1,1,0,2])
mapNleft2Ndown([1,2,1,0])
mapNleft2Ndown([1,2,0,1])
mapNleft2Ndown([2,0,2,0])
mapNleft2Ndown([2,0,1,1])
mapNleft2Ndown([2,0,0,2])
mapNleft2Ndown([2,1,1,0])
mapNleft2Ndown([2,1,0,1])
mapNleft2Ndown([2,2,0,0])
```

Results:
```julia
julia> mapNleft2Ndown([0,0,2,2])
4-element Vector{Int64}:
 0
 2
 0
 2

julia> mapNleft2Ndown([0,1,2,1])
4-element Vector{Int64}:
 1
 1
 0
 2

julia> mapNleft2Ndown([0,1,1,2])
4-element Vector{Int64}:
 1
 2
 0
 1

julia> mapNleft2Ndown([0,2,2,0])
4-element Vector{Int64}:
 2
 0
 0
 2

julia> mapNleft2Ndown([0,2,1,1])
4-element Vector{Int64}:
 2
 1
 0
 1

julia> mapNleft2Ndown([0,2,0,2])
4-element Vector{Int64}:
 2
 2
 0
 0

julia> mapNleft2Ndown([1,0,2,1])
4-element Vector{Int64}:
 0
 1
 1
 2

julia> mapNleft2Ndown([1,0,1,2])
4-element Vector{Int64}:
 0
 2
 1
 1

julia> mapNleft2Ndown([1,1,2,0])
4-element Vector{Int64}:
 1
 0
 1
 2

julia> mapNleft2Ndown([1,1,0,2])
4-element Vector{Int64}:
 1
 2
 1
 0

julia> mapNleft2Ndown([1,2,1,0])
4-element Vector{Int64}:
 2
 0
 1
 1

julia> mapNleft2Ndown([1,2,0,1])
4-element Vector{Int64}:
 2
 1
 1
 0

julia> mapNleft2Ndown([2,0,2,0])
4-element Vector{Int64}:
 0
 0
 2
 2

julia> mapNleft2Ndown([2,0,1,1])
4-element Vector{Int64}:
 0
 1
 2
 1

julia> mapNleft2Ndown([2,0,0,2])
4-element Vector{Int64}:
 0
 2
 2
 0

julia> mapNleft2Ndown([2,1,1,0])
4-element Vector{Int64}:
 1
 0
 2
 1

julia> mapNleft2Ndown([2,1,0,1])
4-element Vector{Int64}:
 1
 1
 2
 0

julia> mapNleft2Ndown([2,2,0,0])
4-element Vector{Int64}:
 2
 0
 2
 0
```

## Mapping N_up to N_down

```julia
mapNup2Ndown([0,0,2,2])
mapNup2Ndown([0,1,2,1])
mapNup2Ndown([0,1,1,2])
mapNup2Ndown([0,2,2,0])
mapNup2Ndown([0,2,1,1])
mapNup2Ndown([0,2,0,2])
mapNup2Ndown([1,0,2,1])
mapNup2Ndown([1,0,1,2])
mapNup2Ndown([1,1,2,0])
mapNup2Ndown([1,1,0,2])
mapNup2Ndown([1,2,1,0])
mapNup2Ndown([1,2,0,1])
mapNup2Ndown([2,0,2,0])
mapNup2Ndown([2,0,1,1])
mapNup2Ndown([2,0,0,2])
mapNup2Ndown([2,1,1,0])
mapNup2Ndown([2,1,0,1])
mapNup2Ndown([2,2,0,0])
```

Results:
```julia
julia> mapNup2Ndown([0,0,2,2])
4-element Vector{Int64}:
 2
 2
 0
 0

julia> mapNup2Ndown([0,1,2,1])
4-element Vector{Int64}:
 1
 2
 1
 0

julia> mapNup2Ndown([0,1,1,2])
4-element Vector{Int64}:
 2
 1
 1
 0

julia> mapNup2Ndown([0,2,2,0])
4-element Vector{Int64}:
 0
 2
 2
 0

julia> mapNup2Ndown([0,2,1,1])
4-element Vector{Int64}:
 1
 1
 2
 0

julia> mapNup2Ndown([0,2,0,2])
4-element Vector{Int64}:
 2
 0
 2
 0

julia> mapNup2Ndown([1,0,2,1])
4-element Vector{Int64}:
 1
 2
 0
 1

julia> mapNup2Ndown([1,0,1,2])
4-element Vector{Int64}:
 2
 1
 0
 1

julia> mapNup2Ndown([1,1,2,0])
4-element Vector{Int64}:
 0
 2
 1
 1

julia> mapNup2Ndown([1,1,0,2])
4-element Vector{Int64}:
 2
 0
 1
 1

julia> mapNup2Ndown([1,2,1,0])
4-element Vector{Int64}:
 0
 1
 2
 1

julia> mapNup2Ndown([1,2,0,1])
4-element Vector{Int64}:
 1
 0
 2
 1

julia> mapNup2Ndown([2,0,2,0])
4-element Vector{Int64}:
 0
 2
 0
 2

julia> mapNup2Ndown([2,0,1,1])
4-element Vector{Int64}:
 1
 1
 0
 2

julia> mapNup2Ndown([2,0,0,2])
4-element Vector{Int64}:
 2
 0
 0
 2

julia> mapNup2Ndown([2,1,1,0])
4-element Vector{Int64}:
 0
 1
 1
 2

julia> mapNup2Ndown([2,1,0,1])
4-element Vector{Int64}:
 1
 0
 1
 2

julia> mapNup2Ndown([2,2,0,0])
4-element Vector{Int64}:
 0
 0
 2
 2
```