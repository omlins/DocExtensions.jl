"""
Module DocumenterExtensions

Provides specific punctual extensions to Documenter.jl.
"""
module DocumenterExtensions

## Alphabetical include of submodules.
using ..Exceptions

## Alphabetical include of function/data type definition files
include("mdinclude.jl")

## Exports (need to be after include of submodules if re-exports from them)
export mdinclude
end
