
using Pkg
Pkg.activate(".")

using Documenter
using Repos

makedocs(
    modules     = [Repos],
    format = Documenter.HTML(
        prettyurls = false,
        canonical = "https://bridgewalker.github.io/Repos.jl/stable/",
        assets = ["assets//favicon.ico","assets//myjs.js","assets/mystyle.css"],
    ),
    sitename    = "Repos.jl",
    pages       = Any[
        "Getting started"                   => "index.md",
        "About the package"                 => "project.md",
        "List of functions"                 => "functions.md"
    ]
)
