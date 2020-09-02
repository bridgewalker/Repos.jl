# Repos.jl

*Repos provides a highly efficient data structure (Repo) that can be used for organizing data into a set of "classes".*

Repo behaves like an array, where you can additionally assign each element of the array to a "class". You can dynamically change the an element's class, find out how many elements are in a certain class, iterate through the elements in a given class or pick a single element from a class (e.g. at random).

Importantly, the time required for these operations is independent of the number of elements stored in Repo and only linearly increases with the number of classes. Thereby Repo enables extremely fast (linear time) agent-based simulations.   

## Example

```jldoctest
julia> using Repos

julia> a=["Pepsis grossa","Smilodon populator","Nothrotheriops texanus"]
3-element Array{String,1}:
 "Pepsis grossa"
 "Smilodon populator"
 "Nothrotheriops texanus"

julia> animals=Repo(a,2)
Repository of 3 objects in 2 classes

julia> alive=class(animals,2)
Class of 0 objects

julia> setclass!(animals,1,2)

julia> print_repo(animals)
Repository of 2 classes
  Class 1
    1 - 2: Smilodon populator
    2 - 3: Nothrotheriops texanus
  Class 2
    1 - 1: Pepsis grossa

julia> print_repo(alive)
Class of 1 objects
    1 - 1: Pepsis grossa

julia> alive[1]
"Pepsis grossa"
```

## Project Status

This package was tested on Julia 1.4.2 on Windows.
