"""
Module DocExtensions

Provides extensions to documentation tools as Documenter.jl and Literate.jl, including a simple file processor for pre- or post-processing of files.
"""
module DocExtensions

## Alphabetical include of submodules.
include("Exceptions.jl")
include(joinpath("FileProcessor","FileProcessor.jl"))
include(joinpath("DocumenterExtensions","DocumenterExtensions.jl"))
using .Exceptions
import .FileProcessor
import .DocumenterExtensions

## Alphabetical include of function/data type definition files
include("expand_reflinks.jl")

## Exports (need to be after include of submodules if re-exports from them)
export FileProcessor, DocumenterExtensions
export expand_reflinks
end
