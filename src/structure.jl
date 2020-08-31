"""
    Repo{T}

one-dimensional array, containing classifiable elements of type T.

Each element of Repo can be assigned to a class, identified by an integer.
All elements are intially in class one. Importantly, the time needed for
accessing elements, reassigning an element to a different class and
counting the number of elements is independent of the number of elements in the
class. This can be used for example to write highly-performant event-driven
simulations.

# Example
```jldoctest
julia> using Repos

julia> r=Repo(["Apple","Carrot","Cherry","Pepper"],2)
Repository of 4 objects in 2 classes

julia> setclass!(r,1,2)

julia> setclass!(r,3,2)

julia> print_repo(r)
Repository of 2 classes
  Class 1
    1 - 4: Pepper
    2 - 2: Carrot
  Class 2
    1 - 3: Cherry
    2 - 1: Apple

julia> fruits=class(r,2)
Class of 2 objects

julia> print_repo(fruits)
Class of 2 objects
    1 - 3: Cherry
    2 - 1: Apple
```
"""
mutable struct Repo{T} <: AbstractVector{T}
    starts::Array{Int,1}
    counts::Array{Int,1}
    ids::Array{Int,1}
    pos::Array{Int,1}
    cargo::Array{T,1}
    N::Int
    C::Int
end

"""
    RepoClass{T}

A class of elements in a Repo structure.

The RepoClass is an interface for the Repo structure. This means that instances
of RepoClass automatically update if the corresponding Repo is changed.

# Example
```jldoctest
julia> using Repos

julia> r=Repo(["Peter","Paul","Mary"],2)
Repository of 3 objects in 2 classes

julia> infected=class(r,2)
Class of 0 objects

julia> setclass!(r,1,2)

julia> infected
Class of 1 objects

julia> print_repo(infected)
Class of 1 objects
    1 - 1: Peter
```
"""
struct RepoClass{T} <: AbstractVector{T}
    repo::Repo{T}
    c::Int
end
