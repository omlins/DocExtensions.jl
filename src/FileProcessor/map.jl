"""
    map(f, filepattern, args...; outfilepattern=filepattern, rootdir=".")

Transform the file or collection of files in directory `rootdir` defined by `filepattern` by applying `f` to content of each file (calling `f(content, args...)`), writing the result back to the file(s) specified with `outfilepattern`; for both `filepattern` and `outfilepattern` currently supported is a file name extension (e.g. filepattern = `".MD"` and outfilepattern = `".md"`) or simply an explicit file name. The results of the file content transformation is also returned as a Vector of Strings.

## Arguments
- `f::Function`: the function to be applied to the content of the files.
- `filepattern::AbstractString=".MD"`: a file extension or file name defining the files to be processed.
- `args...`: arguments to be passed to `f` in addition to the content of each file.

## Keyword Arguments
- `outfilepattern::AbstractString=".MD"`: a file extension or file name defining the name(s) of the output files.
- `rootdir::AbstractString="."`: the root directory of the files to be processed.
- `do_write::Bool=true`:: whether to actually write the results into file(s).

# Example
```julia
docsrc             = joinpath(@_DIR_, "src")
file_extension     = ".MD"
new_file_extension = ".md"
reflinks           = Dict("[Adapt.jl]"        => "https://github.com/JuliaGPU/Adapt.jl",
                          "[AMDGPU.jl]"       => "https://github.com/JuliaGPU/AMDGPU.jl",
                          "[CellArrays.jl]"   => "https://github.com/omlins/CellArrays.jl",
                          "[CUDA.jl]"         => "https://github.com/JuliaGPU/CUDA.jl",
                          "[StaticArrays.jl]" => "https://github.com/JuliaArrays/StaticArrays.jl",
)

escape(s)      = "\\Q" * escape_string(s) * "\\E"
pattern        = Regex("(" * join(escape.(keys(reflinks)), "|") * ")(?![(].*[)])")
replace_str(x) = "\$x(\$(reflinks[x]))"

FileProcessor.map(replace, file_extension, pattern => replace_str; outfilepattern=new_file_extension, rootdir="src")
```
"""
function map(f::Function, filepattern::AbstractString, args...; outfilepattern::AbstractString=filepattern, rootdir::AbstractString=".", do_write::Bool=true)
    results = String[]
    for (root, dirs, files) in walkdir(rootdir)
        @debug "DocExtensions: FileProcessor.map: Processing file(s) matching $filepattern in $root..."
        for file in filter(endswith(filepattern), files)
            filepath = joinpath(root, file)
            content  = read(filepath, String)
            content  = replace(content, args...)
            push!(results, content)
            if (do_write)
                filepath = filepath[1:end-length(filepattern)] * outfilepattern
                @info "-> Writing $filepath..."
                write(filepath, content)
            end
        end
    end
    return results
end
