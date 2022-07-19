"""
Module FileProcessor

Provides  extensions to documentation tools as Documenter.jl and Literate.jl, including a basic file processor for pre- or post-processing of files.
"""
module FileProcessor

## Alphabetical include of submodules.
include(joinpath("..", "Exceptions.jl"))
using .Exceptions

## Alphabetical include of function/data type definition files
include("map.jl")

## Exports (need to be after include of submodules if re-exports from them)
export FileProcessor
end
