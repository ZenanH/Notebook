using Pkg
using Dates

function installation(command::Symbol=:NOCUDA)
    PKG_NOCUDA = ["AbstractPlotting", "BenchmarkTools", "CSV", "Clustering", "Conda",
                  "DataFrames", "Documenter", "GLMakie", "IJulia", "IterativeSolvers",
                  "JuliaFormatter", "Makie", "Meshes", "OhMyREPL", "Pardiso", "PkgTemplates",
                  "PlotlyJS", "PyCall", "Query", "Revise", "TimerOutputs", "VegaLite",
                  "WebIO", "WriteVTK"]
    PKG_CUDA = ["AbstractPlotting", "BenchmarkTools", "CSV", "CUDA", "Clustering", "Conda",
                "DataFrames", "Documenter", "GLMakie", "IJulia", "IterativeSolvers",
                "JuliaFormatter", "Makie", "Meshes", "OhMyREPL", "Pardiso", "PkgTemplates",
                "PlotlyJS", "PyCall", "Query", "Revise", "TimerOutputs", "VegaLite",
                "WebIO", "WriteVTK"]

    if command == :NOCUDA
        for i in PKG_NOCUDA
            Pkg.add("$i")
        end
        Pkg.build()
        Pkg.precompile()
        Pkg.gc()
        Pkg.update()
    elseif command == :CUDA
        for i in PKG_CUDA
            Pkg.add("$i")
        end
        Pkg.build()
        Pkg.precompile()
        Pkg.gc()
        Pkg.update()
        Pkg.test("CUDA")
    end

    download("https://raw.githubusercontent.com/ZenanH/JuPyBinder/master/jupyter.jl",
             joinpath(pwd(), "jupyter.jl"))
    include(joinpath(pwd(), "jupyter.jl"))
    rm(joinpath(pwd(), "jupyter.jl"), force=true)

    if command == :NOCUDA
        text = @info "Installation completed(NO_CUDA)!"
    elseif command == :CUDA
        text = @info "Installation completed(CUDA)!"
    end
    return text
end

installation()