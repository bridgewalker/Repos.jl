
"""
    Repo{T}(N::Int,C::Int)

Create a repository that organizes N elements of type T into C classes.

# Example
```jldoctest
julia> using Repos

julia> r=Repo{String}(50000,4)
Repository of 50000 objects in 4 classes
```
"""
function Repo{T}(N::Int,C::Int) where {T}
    starts=Array{Int,1}(undef,C)
    counts=Array{Int,1}(undef,C)
    ids=[1:N...]
    pos=[1:N...]
    cargo=Array{T,1}(undef,N)
    counts.=0
    starts.=N+1
    counts.=0
    counts[1]=N
    starts[1]=1
    return Repo{T}(starts,counts,ids,pos,cargo,N,C)
end

"""
    Repo(a::Array,C::Int)

Create a repository that organizes an existing array into C classes.

The repository will not copy the array, so the memory is only allocated once
and any changes you make in the array will be reflected in the repository.

# Example
```jldoctest
julia> using Repos

julia> a=["red","green","blue"];

julia> r=Repo(a,2)
Repository of 3 objects in 2 classes

julia> a[1]="cyan";

julia> print_repo(r)
Repository of 2 classes
  Class 1
    1 - 1: cyan
    2 - 2: green
    3 - 3: blue
  Class 2
```
"""
function Repo(a::Array{T,1},C::Int) where T
    starts=Array{Int,1}(undef,C)
    counts=Array{Int,1}(undef,C)
    N=length(a)
    ids::Array{Int,1}=[1:N...]
    pos::Array{Int,1}=[1:N...]
    cargo=a
    counts.=0
    starts.=N+1
    counts.=0
    counts[1]=N
    starts[1]=1
    return Repo{T}(starts,counts,ids,pos,cargo,N,C)
end
