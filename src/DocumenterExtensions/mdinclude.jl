using Markdown

"""
    mdinclude(path)

Include a file as markdown content. Files with a ".jl"-extension are included as a Julia code block; files with any other extension are parsed as markdown. 
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
