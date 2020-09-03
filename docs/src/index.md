# Repos.jl

*Repos provides a highly efficient data structure (Repo) that can be used for organizing data into a set of "classes".*

Repo behaves like an array, where you can additionally assign each element of the array to a "class". You can dynamically change the an element's class, find out how many elements are in a certain class, iterate through the elements in a given class or pick a single element from a class (e.g. at random).

Importantly, the time required for these operations is independent of the number of elements stored in Repo and only linearly increases with the number of classes. Thereby Repo enables extremely fast (linear time) agent-based simulations.   

## Example


## Project Status

This package was tested on Julia 1.4.2 on Windows.
