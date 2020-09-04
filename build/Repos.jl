module Repos

include("structure.jl")
include("internal.jl")
include("construction.jl")
include("class.jl")
include("id.jl")
include("interfaces.jl")
include("print.jl")

export Repo,RepoClass,setclass!,getclass,class,print_repo,repo_id

end
