"""
Module FileProcessor

Enableds convinient text file processing.
"""
module FileProcessor

## Alphabetical include of submodules.
include(joinpath("..", "Exceptions.jl"))
using .Exceptions

## Alphabetical include of function/data type definition files
include("map.jl")

## Exports (need to be after include of submodules if re-exports from them)

end
