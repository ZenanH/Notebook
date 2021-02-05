using PackageCompiler, Makie, AbstractPlotting, GLMakie, Test

PackageCompiler.create_sysimage(:Makie; sysimage_path=joinpath(@__DIR__, "MakieSys.so"),
                                precompile_execution_file=joinpath(pkgdir(Makie), "test",
                                                                   "test_for_precompile.jl")) 