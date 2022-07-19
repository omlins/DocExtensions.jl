using DocExtensions
using Documenter

DocMeta.setdocmeta!(DocExtensions, :DocTestSetup, :(using DocExtensions); recursive=true)

makedocs(;
    modules=[DocExtensions],
    authors="Samuel Omlin",
    repo="https://github.com/omlins/DocExtensions.jl/blob/{commit}{path}#{line}",
    sitename="DocExtensions.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://omlins.github.io/DocExtensions.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/omlins/DocExtensions.jl",
    devbranch="main",
)
