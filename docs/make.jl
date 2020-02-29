using Documenter, SialiaCLI

makedocs(;
    modules=[SialiaCLI],
    format=Documenter.HTML(),
    pages=[
        "Home" => "index.md",
    ],
    repo="https://github.com/wardlem/SialiaCLI.jl/blob/{commit}{path}#L{line}",
    sitename="SialiaCLI.jl",
    authors="Mark Wardle, Potient",
    assets=String[],
)

deploydocs(;
    repo="github.com/wardlem/SialiaCLI.jl",
)
