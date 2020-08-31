

# Internal function to exchange to references in the repository

function _swap(repo::Repo{T},posa::Int,posb::Int) where T
    ida=repo.ids[posa]
    idb=repo.ids[posb]
    repo.pos[ida]=posb
    repo.pos[idb]=posa
    repo.ids[posa]=idb
    repo.ids[posb]=ida
end

function _print_class(repo::Repo{T},c::Int,max::Int) where T
    N=repo.counts[c]
    maxh=fld1(max,2)
    if N<=max || maxh<1
        for i=1:N
            id=repo_id(repo,c,i)
            println("    $i - $id: $(repo[id])")
        end
    else
        for i=1:maxh
            id=repo_id(repo,c,i)
            println("    $i - $id: $(repo[id])")
        end
        println("    ...")
        for i=(N-maxh+1):N
            id=repo_id(repo,c,i)
            println("    $i - $id: $(repo[id])")
        end
    end
end

function _print_class(io::IO,repo::Repo{T},c::Int,max::Int) where T
    N=repo.counts[c]
    maxh=fld1(max,2)
    if N<=max || maxh<1
        for i=1:N
            id=repo_id(repo,c,i)
            println(io,"    $i - $id: $(repo[id])")
        end
    else
        for i=1:maxh
            id=repo_id(repo,c,i)
            println(io,"    $i - $id: $(repo[id])")
        end
        println("    ...")
        for i=(N-maxh+1):N
            id=repo_id(repo,c,i)
            println(io,"    $i - $id: $(repo[id])")
        end
    end
end
