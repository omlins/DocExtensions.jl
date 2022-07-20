using Test
using Markdown
using DocExtensions

const PKGROOT = joinpath(@__DIR__, "..", "..")
const DOCROOT = joinpath(PKGROOT, "docs")
const DOCSRC  = joinpath(DOCROOT, "src")

@testset "$(basename(@__FILE__))" begin
    @testset "1. expand reference links" begin
        include(joinpath(DOCROOT, "reflinks.jl"))
        results = MarkdownExtensions.expand_reflinks(reflinks; filepattern="index.MD")
        content = results[1]
        @test occursin("[DocExtensions.jl](https://github.com/omlins/DocExtensions.jl)", content)
        @test occursin("[Documenter.jl](https://github.com/JuliaDocs/Documenter.jl)", content)
        @test occursin("[Literate.jl](https://github.com/fredrikekre/Literate.jl)", content)
    end;
end;
