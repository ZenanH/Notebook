using Pkg

println("██╗  ██╗██╗            ██╗██╗   ██╗██╗     ██╗ █████╗        ██╗ ")
println("██║  ██║██║            ██║██║   ██║██║     ██║██╔══██╗    ██╗╚██╗")
println("███████║██║            ██║██║   ██║██║     ██║███████║    ╚═╝ ██║")
println("██╔══██║██║       ██   ██║██║   ██║██║     ██║██╔══██║    ██╗ ██║")
println("██║  ██║██║▄█╗    ╚█████╔╝╚██████╔╝███████╗██║██║  ██║    ╚═╝██╔╝")
println("╚═╝  ╚═╝╚═╝╚═╝     ╚════╝  ╚═════╝ ╚══════╝╚═╝╚═╝  ╚═╝       ╚═╝ ")
println("")
@info "Enter start() or start(cuda) will start to install packages."

cuda = "CUDA"
function start(cuda)
    JULIA_PACKAGES = [
        "BenchmarkTools",
        "CSV",
        "Clustering",
        "Conda",
        "CUDA",
        "DataFrames",
        "IterativeSolvers",
        "ORCA",
        "Pardiso",
        "PkgTemplates",
        "PlotlyJS",
        "Pluto",
        "PyCall",
        "Query",
        "TimerOutputs",
        "VegaLite",
    ]

    for i in JULIA_PACKAGES
        @info "preparing to install $i"
    end
    println("")

    for i in JULIA_PACKAGES
        Pkg.add("$i")
        @info "$i downloaded successful"
    end
    println("")

    @info "starting to build all packages"
    Pkg.build()
    println("")

    @info "starting to precompile all packages"
    Pkg.precompile()
    println("")

    @info "starting to GC"
    Pkg.gc()
    println("")

    @info "updating register"
    Pkg.update()
    println("")
    Pkg.update()
    println("")

    @info "JULIA ENV INFO:"
    versioninfo(verbose = true)
    println("")

    if "CUDA" in JULIA_PACKAGES
        @info "starting to test CUDA tookits"
    println("")

    @info "finished all settings!"
    return nothing
end
    return nothing
end

function start()
    JULIA_PACKAGES = [
        "BenchmarkTools",
        "CSV",
        "Clustering",
        "Conda",
        "DataFrames",
        "IterativeSolvers",
        "ORCA",
        "Pardiso",
        "PkgTemplates",
        "PlotlyJS",
        "Pluto",
        "PyCall",
        "Query",
        "TimerOutputs",
        "VegaLite",
    ]

    for i in JULIA_PACKAGES
        @info "preparing to install $i"
    end
    for i in JULIA_PACKAGES
        Pkg.add("$i")
        @info "$i downloaded successful"
    end
    println("")

    @info "starting to build all packages"
    Pkg.build()
    println("")

    @info "starting to precompile all packages"
    Pkg.precompile()
    println("")

    @info "starting to GC"
    Pkg.gc()
    println("")

    @info "updating register"
    Pkg.update()
    println("")

    @info "JULIA ENV INFO:"
    Pkg.update()
    println("")

    @info "JULIA ENV INFO:"
    versioninfo(verbose = true)
    println("")

    @info "finished all settings!"
    return nothing