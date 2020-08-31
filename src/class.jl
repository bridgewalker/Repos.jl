"""
    getclass(repo::Repo{T},id::Int)

Return the class number of element id in  repo.

# Example
```jldoctest
julia> using Repos

julia> r=Repo(["red","green","blue"],2)
Repository of 3 objects in 2 classes

julia> getclass(r,1)
1
```
"""
function getclass(repo::Repo{T},id::Int) where T
    pos=repo.pos[id]
    for c in 1:repo.C
        start=repo.starts[c]
        cend=start+repo.counts[c]
        if pos<cend
            return c
        end
    end
    error("Repo could not determine class of $id")
    return 0
end

"""
    setclass!(repo::Repo{T},id::Int,cls::Int) where T

Change the class of item number id in repo to cls.

# Example
```
julia> using Repos

julia> r=Repo(["red","green","blue"],2)
Repository of 3 objects in 2 classes

julia> setclass!(r,1,2)

julia> print_repo(r)
Repository of 2 classes
  Class 1
    1 - 3: blue
    2 - 2: green
  Class 2
    1 - 1: red
```
"""
function setclass!(repo::Repo{T},id::Int,cls::Int) where T
    curc::Int=getclass(repo,id)
    while curc<cls
        lastposincur=repo.starts[curc]+repo.counts[curc]-1
        curpos=repo.pos[id]
        _swap(repo,lastposincur,curpos)
        repo.counts[curc]-=1
        curc+=1
        repo.starts[curc]-=1
        repo.counts[curc]+=1
    end
    while curc>cls
        firstposincur=repo.starts[curc]
        curpos=repo.pos[id]
        _swap(repo,firstposincur,curpos)
        repo.counts[curc]-=1
        repo.starts[curc]+=1
        curc-=1
        repo.counts[curc]+=1
    end
    return nothing
end

"""
     class(repo::Repo{T},c::Int)

Return an interface to class c in repository repo.

The returned RepoClass structure is an interface to the object of the respective
class in the repository. The RepoClass will stay up to date when the repository
is updated.

# Example
```jldoctest
julia> using Repos

julia> a=["Golden Delicious","Granny Smith","Red Delicious","Valencia"]
4-element Array{String,1}:
 "Golden Delicious"
 "Granny Smith"
 "Red Delicious"
 "Valencia"

julia> r=Repo(a,2)
Repository of 4 objects in 2 classes

julia> apples=class(r,1)
Class of 4 objects

julia> setclass!(r,4,2)

julia> a[3]="Braeburn"
"Braeburn"

julia> print_repo(apples)
Class of 3 objects
    1 - 1: Golden Delicious
    2 - 2: Granny Smith
    3 - 3: Braeburn
```
"""
function class(repo::Repo{T},c::Int) where T
    return RepoClass{T}(repo,c)
end
