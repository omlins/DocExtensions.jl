var documenterSearchIndex = {"docs":
[{"location":"api/","page":"API reference","title":"API reference","text":"CurrentModule = DocExtensions","category":"page"},{"location":"api/#API-reference","page":"API reference","title":"API reference","text":"","category":"section"},{"location":"api/#Extensions-to-Markdown","page":"API reference","title":"Extensions to Markdown","text":"","category":"section"},{"location":"api/","page":"API reference","title":"API reference","text":"Modules = [DocExtensions.MarkdownExtensions]","category":"page"},{"location":"api/","page":"API reference","title":"API reference","text":"Modules = [DocExtensions.MarkdownExtensions]","category":"page"},{"location":"api/#DocExtensions.MarkdownExtensions","page":"API reference","title":"DocExtensions.MarkdownExtensions","text":"Module MarkdownExtensions\n\nProvides extensions to Markdown (in particular features that are only available in particular Markdown flavors).\n\n\n\n\n\n","category":"module"},{"location":"api/#DocExtensions.MarkdownExtensions.expand_reflinks-Tuple{Dict{<:AbstractString, <:AbstractString}}","page":"API reference","title":"DocExtensions.MarkdownExtensions.expand_reflinks","text":"expand_reflinks(reflinks; filepattern=\".MD\", outfilepattern=\".md\", rootdir=\".\")\n\nExpand the reference links reflinks in the file or collection of files in directory rootdir defined by filepattern, writing the result back to the file(s) specified with outfilepattern; for both filepattern and outfilepattern currently supported is a file name extension (e.g. filepattern = \".MD\" and outfilepattern = \".md\") or simply an explicit file name.\n\nArguments\n\nreflinks::Dict{<:AbstractString, <:AbstractString}: the reference links to be expanded.\n\nKeyword Arguments\n\n`filepattern::AbstractString=\".MD\": a file extension or file name defining the files to be processed.\n`outfilepattern::AbstractString=\".MD\": a file extension or file name defining the name(s) of the output files.\nrootdir::AbstractString=\".\": the root directory of the files to be processed.\n\n\n\n\n\n","category":"method"},{"location":"api/#Specific-punctual-extensions-to-[Documenter.jl](https://github.com/JuliaDocs/Documenter.jl)","page":"API reference","title":"Specific punctual extensions to Documenter.jl","text":"","category":"section"},{"location":"api/","page":"API reference","title":"API reference","text":"Modules = [DocExtensions.DocumenterExtensions]","category":"page"},{"location":"api/","page":"API reference","title":"API reference","text":"Modules = [DocExtensions.DocumenterExtensions]","category":"page"},{"location":"api/#DocExtensions.DocumenterExtensions","page":"API reference","title":"DocExtensions.DocumenterExtensions","text":"Module DocumenterExtensions\n\nProvides specific punctual extensions to Documenter.jl.\n\n\n\n\n\n","category":"module"},{"location":"api/#DocExtensions.DocumenterExtensions.mdinclude-Tuple{AbstractString}","page":"API reference","title":"DocExtensions.DocumenterExtensions.mdinclude","text":"mdinclude(path)\n\nInclude a file as markdown content. Files with a \".jl\"-extension are included as a Julia code block; files with any other extension are parsed as markdown. \n\n\n\n\n\n","category":"method"},{"location":"api/#Simple-generic-file-processor","page":"API reference","title":"Simple generic file processor","text":"","category":"section"},{"location":"api/","page":"API reference","title":"API reference","text":"Modules = [DocExtensions.FileProcessor]","category":"page"},{"location":"api/","page":"API reference","title":"API reference","text":"Modules = [DocExtensions.FileProcessor]","category":"page"},{"location":"api/#DocExtensions.FileProcessor","page":"API reference","title":"DocExtensions.FileProcessor","text":"Module FileProcessor\n\nEnableds convinient text file processing.\n\n\n\n\n\n","category":"module"},{"location":"api/#DocExtensions.FileProcessor.map-Tuple{Function, AbstractString, Vararg{Any}}","page":"API reference","title":"DocExtensions.FileProcessor.map","text":"map(f, filepattern, args...; outfilepattern=filepattern, rootdir=\".\")\n\nTransform the file or collection of files in directory rootdir defined by filepattern by applying f to content of each file (calling f(content, args...)), writing the result back to the file(s) specified with outfilepattern; for both filepattern and outfilepattern currently supported is a file name extension (e.g. filepattern = \".MD\" and outfilepattern = \".md\") or simply an explicit file name.\n\nArguments\n\nf::Function: the function to be applied to the content of the files.\n`filepattern::AbstractString=\".MD\": a file extension or file name defining the files to be processed.\nargs...: arguments to be passed to f in addition to the content of each file.\n\nKeyword Arguments\n\n`outfilepattern::AbstractString=\".MD\": a file extension or file name defining the name(s) of the output files.\nrootdir::AbstractString=\".\": the root directory of the files to be processed.\n\nExample\n\ndocsrc             = joinpath(@_DIR_, \"src\")\nfile_extension     = \".MD\"\nnew_file_extension = \".md\"\nreflinks           = Dict(\"[Adapt.jl]\"        => \"https://github.com/JuliaGPU/Adapt.jl\",\n                          \"[AMDGPU.jl]\"       => \"https://github.com/JuliaGPU/AMDGPU.jl\",\n                          \"[CellArrays.jl]\"   => \"https://github.com/omlins/CellArrays.jl\",\n                          \"[CUDA.jl]\"         => \"https://github.com/JuliaGPU/CUDA.jl\",\n                          \"[StaticArrays.jl]\" => \"https://github.com/JuliaArrays/StaticArrays.jl\",\n)\n\nescape(s)      = \"\\Q\" * escape_string(s) * \"\\E\"\npattern        = Regex(\"(\" * join(escape.(keys(reflinks)), \"|\") * \")(?![(].*[)])\")\nreplace_str(x) = \"$x($(reflinks[x]))\"\n\nFileProcessor.map(replace, file_extension, pattern => replace_str; outfilepattern=new_file_extension, rootdir=\"src\")\n\n\n\n\n\n","category":"method"},{"location":"usage/#Usage","page":"Usage","title":"Usage","text":"","category":"section"},{"location":"usage/","page":"Usage","title":"Usage","text":"Have a look at the Examples and see the API reference for details on the usage of DocExtensions.","category":"page"},{"location":"usage/#Installation","page":"Usage","title":"Installation","text":"","category":"section"},{"location":"usage/","page":"Usage","title":"Usage","text":"DocExtensions can be installed directly with the Julia package manager from the REPL:","category":"page"},{"location":"usage/","page":"Usage","title":"Usage","text":"julia>]\n  pkg> add DocExtensions","category":"page"},{"location":"examples/#Examples","page":"Examples","title":"Examples","text":"","category":"section"},{"location":"examples/","page":"Examples","title":"Examples","text":"This documentation is itself build using DocExtensions (and of course Documenter.jl) and is therefore an example.","category":"page"},{"location":"#[DocExtensions.jl](https://github.com/omlins/DocExtensions.jl)-[![Star-on-GitHub](https://img.shields.io/github/stars/omlins/DocExtensions.jl.svg)](https://github.com/omlins/DocExtensions.jl/stargazers)","page":"Introduction","title":"DocExtensions.jl (Image: Star on GitHub)","text":"","category":"section"},{"location":"","page":"Introduction","title":"Introduction","text":"The package DocExtensions Provides specific punctual extensions to documentation tools as Documenter.jl and Literate.jl, as well as some generic extensions to Markdown. In addition, it includes a simple but generic file processor for pre- or post-processing of any kind of text files.","category":"page"},{"location":"#Dependencies","page":"Introduction","title":"Dependencies","text":"","category":"section"},{"location":"","page":"Introduction","title":"Introduction","text":"DocExtensions only relies on Julia standard packages.","category":"page"}]
}
