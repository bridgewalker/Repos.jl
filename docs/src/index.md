# Repos.jl

**Repos provides a highly efficient data structure (Repo) that can be used for organizing data into a set of "classes".**

Repo behaves like an array, where you can additionally assign each element of the array to a "class". You can dynamically change the an element's class, find out how many elements are in a certain class, iterate through the elements in a given class or pick a single element from a class (e.g. at random).

Importantly, the time required for these operations is independent of the number of elements stored in Repo and only linearly increases with the number of classes. Thereby Repo enables extremely fast (linear time) agent-based simulations.   

## Showcase

```jldoctest
julia> using Repos

julia> ar=["Crimson","Azure","Scarlett","Indigo",(169,19,0)]
5-element Array{Any,1}:
 "Crimson"
 "Azure"
 "Scarlett"
 "Indigo"
 (169, 19, 0)

julia> colors=Repo(ar,2)
Repository of 5 objects in 2 classes

julia> reds=class(colors,1)
Class of 5 objects

julia> setclass!(colors,2,2)   #Set the class of object 2 to 2

julia> setclass!(colors,4,2)

julia> print_repo(colors)
Repository of 2 classes
  Class 1
    1 - 1: Crimson
    2 - 5: (169, 19, 0)
    3 - 3: Scarlett
  Class 2
    1 - 4: Indigo
    2 - 2: Azure

julia> reds
Class of 3 objects

julia> blues=class(colors,2)
Class of 2 objects

julia> blues[1]
"Indigo"

julia> blues[2]
"Azure"
```

## Project Status

This package was tested on Julia 1.4.2 on Windows.
