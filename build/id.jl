
"""
    repo_id(repo::Repo{T},c::Int,pos::Int)
    repo_id(repo::Repo{T},pos::Int)
    repo_id(cls::RepoClass{T},pos::Int)

Get the permanent id of an item in the repository identified by
current position or current class and and current position.

In contrast to the position, which can change when setclass is called, the id
of an item never changes.

# Example
```jldoctest
julia> using Repos

julia> r=Repo([1:10...],3)
Repository of 10 objects in 3 classes

julia> repo_id(r,1)
1

julia> setclass!(r,1,3)

julia> repo_id(r,1)
10

julia> repo_id(r,3,1)
1
```
"""
function repo_id(repo::Repo{T},c::Int,pos::Int) where T
    n=repo.starts[c]+pos-1
    return repo.ids[n]
end

function repo_id(repo::Repo{T},pos::Int) where T
    return repo.ids[pos]
end

function repo_id(cls::RepoClass{T},pos::Int) where T
    n=cls.repo.starts[cls.c]+pos-1
    return cls.repo.ids[n]
end
