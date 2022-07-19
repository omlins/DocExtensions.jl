using DocExtensions
using Documenter
using DocExtensions.DocumenterExtensions

const DOCSRC      = joinpath(@__DIR__, "src")

DocMeta.setdocmeta!(DocExtensions, :DocTestSetup, :(using DocExtensions); recursive=true)

@info "Preprocessing .MD-files..."
include("reflinks.jl")
expand_reflinks(reflinks; rootdir=DOCSRC)


@info "Building documentation website using Documenter.jl..."
makedocs(;
    modules  = [DocExtensions],
    authors  = "Samuel Omlin",
    repo     = "https://github.com/omlins/DocExtensions.jl/blob/{commit}{path}#{line}",
    sitename = "DocExtensions.jl",
    format   = Documenter.HTML(;
        prettyurls       = get(ENV, "CI", "false") == "true",
        canonical        = "https://omlins.github.io/DocExtensions.jl",
        collapselevel    = 1,
        sidebar_sitename = true,
        edit_link        = "main",
        #assets           = [asset("https://img.shields.io/github/stars/omlins/CellArrays.jl.svg", class = :ico)],
        #warn_outdated    = true,
    ),
    pages   = [
        "Introduction"  => "index.md",
        "Usage"         => "usage.md",
        "Examples"      => "examples.md",
        "API reference" => "api.md",
    ],
)


@info "Deploying docs..."
deploydocs(;
    repo         = "github.com/omlins/DocExtensions.jl",
    push_preview = true,
    devbranch    = "main",
)
