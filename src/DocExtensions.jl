"""
Module DocExtensions

Provides selective extensions to documentation tools as Documenter.jl and Literate.jl, as well as some generic extensions to Markdown. In addition, it includes a simple but generic file processor for pre- or post-processing of any kind of text files.
"""
module DocExtensions

## Include of submodule with basic functionality, reused in other submodules
include("Exceptions.jl")
include(joinpath("FileProcessor","FileProcessor.jl"))
using .Exceptions
import .FileProcessor

## Alphabetical include of submodules.
include(joinpath("DocumenterExtensions","DocumenterExtensions.jl"))
include(joinpath("MarkdownExtensions","MarkdownExtensions.jl"))
import .DocumenterExtensions
import .MarkdownExtensions

## Alphabetical include of function/data type definition files

## Exports (need to be after include of submodules if re-exports from them)
export DocumenterExtensions, FileProcessor, MarkdownExtensions
end
