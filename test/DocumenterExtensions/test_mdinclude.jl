using Test
using Markdown
import DocExtensions
using DocExtensions.DocumenterExtensions

const PKGROOT = joinpath(@__DIR__, "..", "..")
const DOCROOT = joinpath(PKGROOT, "docs")
const DOCSRC  = joinpath(DOCROOT, "src")

@testset "$(basename(@__FILE__))" begin
    @testset "1. .jl-files" begin
        @test isa(mdinclude(joinpath(DOCROOT, "reflinks.jl")), Markdown.MD)
    end;
    @testset "2. .MD or with other extension" begin
        @test isa(mdinclude(joinpath(DOCSRC, "index.MD")), Markdown.MD)
    end;
end;
