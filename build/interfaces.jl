function Base.getindex(repo::Repo{T},id::Int) where T
    return repo.cargo[id]
end

function Base.getindex(cls::RepoClass{T},pos::Int) where T
    return cls.repo.cargo[repo_id(cls.repo,cls.c,pos)]
end

function Base.getindex(repo::Repo{T},cls::Int,pos::Int) where T
    p=repo.starts[cls]+pos-1
    id=repo.ids[p]
    return repo.cargo[id]
end

function Base.setindex!(repo::Repo{T},val::T,id::Int) where T
    repo.cargo[id]=val
end

function Base.setindex!(repo::Repo{T},val::T,c::Int,pos::Int) where T
    p=repo.starts[cls]+pos-1
    id=repo.ids[p]
    repo.cargo[id]=val
end

function Base.iterate(repo::Repo{T}, n=Int(1)) where T
    if n>repo.N return nothing; end
    return (repo.cargo[n],n+1)
end

function Base.iterate(cls::RepoClass{T}, n=(0,Array{Int,1}(undef,0))) where T
    i=n[1]
    a=n[2]
    if (i==0)
        count=cls.repo.counts[cls.c]
        a=Array{Int,1}(undef,count)
        for j in 1:count
            a[j]=repo_id(cls,j)
        end
        i=1
    end
    if i>length(a) return nothing; end
    return (cls.repo.cargo[a[i]],(i+1,a))
end

function Base.eltype(::Repo{T}) where T
    return T
end

function Base.eltype(::RepoClass{T}) where T
    return T
end

function Base.size(repo::Repo{T}) where T
    return repo.N
end

function Base.size(rc::RepoClass{T}) where T
    repo=rc.repo
    return repo.counts[rc.c]
end

function Base.firstindex(repo::Repo{T}) where T
    return 1
end

function Base.firstindex(cls::RepoClass{T}) where T
    return 1
end

function Base.lastindex(repo::Repo{T}) where T
    return repo.N
end

function Base.lastindex(cls::RepoClass{T}) where T
    return cls.repo.counts[cls.c]
end

function Base.IndexStyle(repo::Repo{T}) where T
    return IndexLinear()
end

function Base.IndexStyle(cls::RepoClass{T}) where T
    return IndexLinear()
end

function Base.length(repo::Repo{T}) where T
    return repo.N
end

function Base.length(cls::RepoClass{T}) where T
    return cls.repo.counts[cls.c]
end
