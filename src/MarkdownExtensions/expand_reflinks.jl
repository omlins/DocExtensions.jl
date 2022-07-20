"""
    expand_reflinks(reflinks; filepattern=".MD", outfilepattern=".md", rootdir=".")

Expand the reference links `reflinks` in the file or collection of files in directory `rootdir` defined by `filepattern`, writing the result back to the file(s) specified with `outfilepattern`; for both `filepattern` and `outfilepattern` currently supported is a file name extension (e.g. filepattern = `".MD"` and outfilepattern = `".md"`) or simply an explicit file name.

## Arguments
- `reflinks::Dict{<:AbstractString, <:AbstractString}`: the reference links to be expanded.

## Keyword Arguments
- `filepattern::AbstractString=".MD": a file extension or file name defining the files to be processed.
- `outfilepattern::AbstractString=".MD": a file extension or file name defining the name(s) of the output files.
- `rootdir::AbstractString="."`: the root directory of the files to be processed.
"""
function expand_reflinks(reflinks::Dict{<:AbstractString, <:AbstractString}; filepattern::AbstractString=".MD", outfilepattern::AbstractString=".md", rootdir::AbstractString=".")
    @info "DocExtensions: expanding reference links in file(s) in directory $rootdir matching \"$filepattern\"..."
    pattern = Regex("(" * join(escape.(keys(reflinks)), "|") * ")(?![(].*[)])")
    replace_str(x) = "$x($(reflinks[x]))"
    FileProcessor.map(replace, filepattern, pattern => replace_str; outfilepattern=outfilepattern, rootdir=rootdir)
end


## Functions related to regex

escape(s) = "\\Q" * escape_string(s) * "\\E"