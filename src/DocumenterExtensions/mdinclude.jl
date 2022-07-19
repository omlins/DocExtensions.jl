using Markdown

"""

"""
function mdinclude(path::AbstractString)
    if endswith(lowercase(path), ".jl")
        Markdown.parse("""
        ```julia
        $(read(path, String))
        ```
        """)
    else
        Markdown.parse_file(path)
    end
end
