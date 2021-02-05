#===========================================================#
#  General layout in a three-dimensional coordinate system  #
#  * author: Zenan Huo                                      #
#  * data  : 2020.05.25                                     #
#===========================================================#

using PlotlyJS
#using ORCA

function sphere(c::Int64, r::Float64 = 1.0)
    trace = AbstractTrace[]
    for i = 1:c
        xtemp = rand(1.0:0.1:10.0)
        ytemp = rand(1.0:0.1:10.0)
        ztemp = rand(1.0:0.1:10.0)

        θ = range(0.0, 2 * π, length = 100)
        ϕ = range(0.0, π, length = 100)

        a = xtemp .+ r * cos.(θ) * sin.(ϕ)'
        b = ytemp .+ r * sin.(θ) * sin.(ϕ)'
        c = ztemp .+ r * ones(100) * cos.(ϕ)'

        push!(
            trace,
            PlotlyBase.surface(
                x = a,
                y = b,
                z = c,
                colorscale = "Greys",
                showscale = false,
            ),
        )
    end

    layout2 = Layout(
        width = 650,
        height = 480,
        autosize = false,
        #margin   = PlotlyBase.attr(l = 100, r = 100, b = 100, t = 40),
        scene = PlotlyBase.attr(
            xaxis = PlotlyBase.attr(
                gridcolor = "rgb(255, 255, 255)",
                #zerolinecolor  = "rgb(255, 255, 255)",
                zeroline = false,
                showbackground = true,
                backgroundcolor = "rgb(230, 230,230)",
            ),
            yaxis = PlotlyBase.attr(
                gridcolor = "rgb(255, 255, 255)",
                #zerolinecolor  = "rgb(255, 255, 255)",
                zeroline = false,
                showbackground = true,
                backgroundcolor = "rgb(230, 230,230)",
            ),
            zaxis = PlotlyBase.attr(
                gridcolor = "rgb(255, 255, 255)",
                #zerolinecolor  = "rgb(255, 255, 255)",
                zeroline = false,
                showbackground = true,
                backgroundcolor = "rgb(230, 230,230)",
            ),
            aspectratio = PlotlyBase.attr(x = 1, y = 1, z = 1),
            aspectmode = "manual",
        ),
    )
    config = Dict(:toImageButtonOptions => Dict(:format => "svg"))
    plot(trace, layout2, options = config)
    #p = Plot(trace, layout2)
    #savefig(p, "E://GitHub//sphere.svg")
end