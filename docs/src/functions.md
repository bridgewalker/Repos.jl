# Function reference
This page contains the complete documentation of Repo functions. Between I have inserted some comments and explanations of the underlying philosophy, as well as
some usage notes.

## Construction
Repo objects can be constructed either from an existing 1-dimensional array or by specifying the element type and number. In both cases the number of classes must be specified.

```@docs
    Repo{T}(N::Int,C::Int) where T
    Repo(a::Array{T,1},C::Int) where T
```

Repo is optimized to deal with very large number of elements. The runtime of most functions should be independent of the number of elements and linear in the number of classes.

Once the repository has been created the number of elements and classes cannot be changed. If you are unsure of how many elements you need, make the Repo large enough and assign unused elements to one class, so one class basically becomes the storage space for unused elements.

## Class functions
The central concept of Repo is that elements stored in the Repo
can be categorized into different classes, where each class is identified by a numerical value. You can set and retrieve the class of an element by the following two functions:

```@docs
    getclass(repo::Repo{T},id::Int) where T
    setclass!(repo::Repo{T},id::Int,cls::Int) where T
```

An interesting function is the class() function this function returns an interface object of type RepoClass. This interface acts as a portal to access the elements in the respective class. It will always remain up to date (No data is actually copied into the interface object).

```@docs
class(repo::Repo{T},c::Int) where T
```

## ID and Length
There are two ways to identify an element in the Repo. First, you can identify an element by it's ID number. This number will always refer to the same element. If you created the Repo from an array, the ID will be identical to the elements number in the array.

Second, you can identify an element by its class and position in the class. This is useful for example for iterating through a class or picking a random element from the class. However, in contrast to ID the position of an element in a class can change when setclass!() is called. If you say, pick using class and position and want to remember which element you picked for later use, you should store it's ID which can be determined by the following functions:

```@docs
    repo_id(repo::Repo{T},c::Int,pos::Int) where T
```

To determine the size of the repository or the elements in a certain class use the length() function.

##### Example

```jldoctest
julia> using Repos

julia> villain=Repo(["Dracula","Frankenstein","Hyde","Catwoman"],2)
Repository of 4 objects in 2 classes

julia> setclass!(villain,4,2)

julia> victorian=class(villain,1)
Class of 3 objects

julia> modern=class(villain,2)
Class of 1 objects

julia> length(villain)
4

julia> length(victorian)
3

julia> length(modern)
1
```

## Element access
You can access element with "[]" like you would in a vector. The elements can be identified either by their id or by class and position. (see the notes on position, above)

##### Example

```jldoctest
julia> using Repos

julia> numbers=Repo([1:1000...],2)
Repository of 1000 objects in 2 classes

julia> setclass!(numbers,123,2)

julia> numbers[1]
1

julia> numbers[123]
123

julia> numbers[2,1]
123

julia> numbers[2,1]=-5
-5

julia> numbers[123]
-5

julia> numbers[1]=-7
-7

julia> numbers[1,1]
-7
```

If you created a Repo from an array you can also change the repo elements by changing the original array (Repo does not
hardcopy the array at creation.)

##### Example

```jldoctest
julia> using Repos

julia> cities=["Kuala Lumpur","Moscow","San Francisco","London","Rio de Janeiro"]
5-element Array{String,1}:
 "Kuala Lumpur"
 "Moscow"
 "San Francisco"
 "London"
 "Rio de Janeiro"

julia> repo=Repo(cities,2)
Repository of 5 objects in 2 classes

julia> capitals=class(repo,1)
Class of 5 objects

julia> setclass!(repo,3,2)

julia> setclass!(repo,5,2)

julia> print_repo(repo)
Repository of 2 classes
  Class 1
    1 - 1: Kuala Lumpur
    2 - 2: Moscow
    3 - 4: London
  Class 2
    1 - 5: Rio de Janeiro
    2 - 3: San Francisco

julia> cities[5] = "Bristol"
"Bristol"

julia> repo[5]
"Bristol"

julia> repo[2,1]
"Bristol"
```

## Iteration
You can iterate over either the Repo or a RepoClass using standard "for" iteration.

##### Example

```jldoctest
julia> using Repos

julia> rock=Repo(["Granite","Diorite","Gabbro","Andesite","Basalt"],2)
Repository of 5 objects in 2 classes

julia> setclass!(rock,3,2)

julia> setclass!(rock,5,2)

julia> mafic=class(rock,2)
Class of 2 objects

julia> for x in rock println(x) end
Granite
Diorite
Gabbro
Andesite
Basalt

julia> for x in mafic println(x) end
Basalt
Gabbro
```

When iterating over the whole Repo the elements are presented in order of element id. When iterating over a class the elements are presented in the order of position withinthe class. So the order can change whenever setclass!() is called.

In the case where functions in the for loop change the class of elements the iteration will still run over all objects that were in the respective class at the start of the loop. So every object that is in the respective class when the iteration starts will be iterated over exactly once.  

If different behavior is desired iterate over the elements using the length() and [].

## Printing
For debugging purposes an overview of a Repo or RepoClass object can be printed. 

```@docs
    print_repo(repo::Repo{T},nax::Int=10) where T
```
