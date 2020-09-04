
"""
    print_repo(repo::Repo{T},nax::Int=10)
    print_repo(cls::RepoClass{T},max::Int=10)
    print_repo(io::IO,repo::Repo{T},nax::Int=10)
    print_repo(io::IO,cls::RepoClass{T},max::Int=10)

Print a summary of the contents of the repository repo or the repository class
cls to REPL or another IO device.

The output lists the classes and shows the first and last entries in every
class. For each entry the current position in the class, the id of the entry,
and the content of the entry are printed.

An optional parameter max can be specified to control the number of entries
that are shown in every repository class. If this parameter is set to less than
2 all entries are shown. (Warning: For large repositories this can take a
while)

# Example
```jldoctest
julia> using Repos

julia> r=Repo(["A","B","C","D","E","F","G"],2)
Repository of 7 objects in 2 classes

julia> setclass!(r,1,2)

julia> setclass!(r,5,2)

julia> vowels=class(r,2)
Class of 2 objects

julia> print_repo(vowels)
Class of 2 objects
    1 - 5: E
    2 - 1: A

julia> r=Repo([1:10000...],2)
Repository of 10000 objects in 2 classes

julia> setclass!(r,1337,2)

julia> print_repo(r,4)
Repository of 2 classes
  Class 1
    1 - 1: 1
    2 - 2: 2
    ...
    9998 - 9998: 9998
    9999 - 9999: 9999
  Class 2
    1 - 1337: 1337
```

"""
function print_repo(repo::Repo{T},max::Int=10) where T
    println("Repository of $(repo.C) classes")
    for c=1:repo.C
        println("  Class $c")
        _print_class(repo,c,max)
    end
end

function print_repo(cls::RepoClass{T},max::Int=10) where T
    n=cls.repo.counts[cls.c]
    println("Class of $n objects")
    _print_class(cls.repo,cls.c,max)
end

function print_repo(io::IO,repo::Repo{T},max::Int=10) where T
    println(io,"Repository of $(repo.C) classes")
    for c=1:repo.C
        println(io,"  Class $c")
        _print_class(io,repo,c,max)
    end
end

function print_repo(io::IO,cls::RepoClass{T},max::Int=10) where T
    n=cls.repo.counts[cls.c]
    println(io,"Class of $n objects")
    _print_class(io,cls.repo,cls.c,max)
end

## Pretty Print

function Base.show(io::IO,::MIME"text/plain",repo::Repo{T}) where T
    print(io,"Repository of $(repo.N) objects in $(repo.C) classes" )
end

function Base.show(io::IO,::MIME"text/plain",rc::RepoClass{T}) where T
    n=size(rc)
    print(io,"Class of $n objects" )
end

function Base.show(io::IO,::MIME"text/html",repo::Repo{T}) where T
    print(io,"Repository of $(repo.N) objects in $(repo.C) classes" )
end

function Base.show(io::IO,::MIME"text/html",rc::RepoClass{T}) where T
    n=size(rc)
    print(io,"Class of $n objects" )
end
