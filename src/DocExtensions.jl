"""
Module DocExtensions

Provides extensions to documentation tools as Documenter.jl and Literate.jl.
"""
module DocExtensions

## Alphabetical include of submodules.
include("Exceptions.jl")
include(joinpath("FileProcessor","FileProcessor.jl"))
using .Exceptions
import .FileProcessor

## Alphabetical include of function/data type definition files
include("expand_reflinks.jl")

## Exports (need to be after include of submodules if re-exports from them)
export FileProcessor, expand_reflinks
end
