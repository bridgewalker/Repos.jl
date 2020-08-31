using Documenter
using Repository

makedocs(
    modules     = [Repository],
    format      = Documenter.HTML(),
    sitename    = "Repository",
    pages       = Any[
        "Getting Started"                   => "index.md",
    ]
)
