```@meta
CurrentModule = DocExtensions
```

# API reference

This is the offical API reference of `DocExtensions`. Note that it can also be queried interactively from the [Julia REPL] using the [help mode](https://docs.julialang.org/en/v1/stdlib/REPL/#Help-mode):
```julia-repl
julia> using DocExtensions
julia>?
help?> DocExtensions
```

## Extensions to Markdown
```@docs
DocExtensions.MarkdownExtensions
```
#### Index
```@index
Modules = [DocExtensions.MarkdownExtensions]
```
#### Documentation
```@autodocs
Modules = [DocExtensions.MarkdownExtensions]
Filter = t -> typeof(t) !== DocExtensions.MarkdownExtensions
```

## Extensions to [Documenter.jl]
```@docs
DocExtensions.DocumenterExtensions
```
#### Index
```@index
Modules = [DocExtensions.DocumenterExtensions]
```
#### Documentation
```@autodocs
Modules = [DocExtensions.DocumenterExtensions]
Filter = t -> typeof(t) !== DocExtensions.DocumenterExtensions
```

## Simple generic file processor
```@docs
DocExtensions.FileProcessor
```
#### Index
```@index
Modules = [DocExtensions.FileProcessor]
```
#### Documentation
```@autodocs
Modules = [DocExtensions.FileProcessor]
Filter = t -> typeof(t) !== DocExtensions.FileProcessor
```
