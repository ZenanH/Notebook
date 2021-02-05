using GLMakie
using Makie
using AbstractPlotting

#AbstractPlotting.inline!(true)
#plots appear inline after each example. Otherwise, an interactive window will open when you return a Figure.

#=
data = Array{Float64,2}(undef, 40, 2)
data[:, 1] = LinRange(-20, 20, 40)
data[:, 2] = data[:, 1] .^ 3
figure, axis, scatterobject = scatter(data; color=colors, markersize=15)
scatterobject.markersize = 10
circlefunc = ts -> 1.5 .* Point2f0.(cos.(ts), sin.(ts))
scatter!(circlefunc, LinRange(0, 2pi, 30), color = :red)
figure
=#

circlefunc = ts -> 1.5 .* Point2f0.(cos.(ts), sin.(ts))
scatter(circlefunc, LinRange(0, 2pi, 30); color=:red)