"""
Module MarkdownExtensions

Provides extensions to Markdown (in particular features that are only available in particular Markdown flavors).
"""
module MarkdownExtensions

## Alphabetical include of submodules.
using ..Exceptions
using ..FileProcessor

## Alphabetical include of function/data type definition files
include("expand_reflinks.jl")

## Exports (need to be after include of submodules if re-exports from them)
export expand_reflinks
end
