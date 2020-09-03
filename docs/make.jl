
using Pkg
Pkg.activate("../.")

using Documenter
using Repos



makedocs(
    modules     = [Repos],
    format = Documenter.HTML(
        prettyurls = false,
        canonical = "https://bridgewalker.github.io/Repos.jl/stable/",
        assets = ["assets/favicon.ico"],
    ),
    sitename    = "Repos.jl",
    pages       = Any[
        "Getting Started"                   => "index.md",
    ]

)

#deploydocs(repo="github.com/bridgewalker/Repos.jl.git",devbranch="gh-pages")
