using Test
using Markdown
using DocExtensions

@testset "$(basename(@__FILE__))" begin
    @testset "1. expand reference links" begin
        include("reflinks.jl")
        results = MarkdownExtensions.expand_reflinks(reflinks; filepattern="index.MD")
        content = results[1]
        @test occursin("[DocExtensions.jl](https://github.com/omlins/DocExtensions.jl)", content)
        @test occursin("[Documenter.jl](https://github.com/JuliaDocs/Documenter.jl)", content)
        @test occursin("[Literate.jl](https://github.com/fredrikekre/Literate.jl)", content)
    end;
end;
