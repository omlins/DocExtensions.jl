"""
    map(filepattern, f, args...; outfilepattern=filepattern, rootdir=".")
    map(filepattern, (f, args)...; outfilepattern=filepattern, rootdir=".")

Transform the file or collection of files in directory `rootdir` defined by `filepattern` by applying `f` to content of each file (calling `f(content, args...)`), writing the result back to the file(s) specified with `outfilepattern`. The results of the file content transformation is also returned as a Vector of Strings. To apply multiple functions to the content of each file, a series of tuples of the kind `(f, args...)` can be passed instead of `f, args...`.

## Arguments
- `f::Function`: the function to be applied to the content of the files.
- `filepattern::AbstractString: a file extension or file name defining the files to be processed.
- `args...`: arguments to be passed to `f` in addition to the content of each file.

## Keyword Arguments
- `outfilepattern::AbstractString=filepattern`: a file extension or file name defining the name(s) of the output files.
- `rootdir::AbstractString="."`: the root directory of the files to be processed.
- `do_write::Bool=true`:: whether to actually write the results into file(s).

# Example
```julia
docsrc             = joinpath(@__DIR__, "src")
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

FileProcessor.map(file_extension, replace, pattern => replace_str; outfilepattern=new_file_extension, rootdir="src")
```
"""
function map(filepattern::AbstractString, f::Function, args...; outfilepattern::AbstractString=filepattern, rootdir::AbstractString=".", do_write::Bool=true)
    map(filepattern, (f, args); outfilepattern=outfilepattern, rootdir=rootdir, do_write=do_write)
end

function map(filepattern::AbstractString, f_args_tuples::Tuple...; outfilepattern::AbstractString=filepattern, rootdir::AbstractString=".", do_write::Bool=true)
    results = String[]
    for (root, dirs, files) in walkdir(rootdir)
        @debug "DocExtensions: FileProcessor.map: Processing file(s) matching $filepattern in $root..."
        for file in filter(endswith(filepattern), files)
            filepath = joinpath(root, file)
            content  = read(filepath, String)
            for (f, args) in f_args_tuples
                content = f(content, args...)
            end
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
