using Documenter
using Repos

Documenter.HTML(assets = [
    "favicon/favicon.ico"
])

makedocs(
    modules     = [Repos],
    format      = Documenter.HTML(),
    sitename    = "Repos.jl",
    pages       = Any[
        "Getting Started"                   => "index.md",
    ]
)

deploydocs(repo="github.com/bridgewalker/Repos.jl.git",devbranch="gh-pages")
