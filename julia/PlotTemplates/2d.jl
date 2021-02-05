#=========================================================#
#  General layout in a two-dimensional coordinate system  #
#  * author: Zenan Huo                                    #
#  * data  : 2020.05.25                                   #
#=========================================================#

using PlotlyJS
using ORCA

function area1()
    trace = GenericTrace[]
    x = sort(rand(1:50, 6))
    for i = 1:10
        trace1 = PlotlyBase.scatter(
            x = x,
            y = sort(rand(1:100, 6)),
            line = PlotlyBase.attr(shape = "spline"),
            mode = "lines",
            name = "line_$i",
        )
        push!(trace, trace1)
    end

    layout = Layout(
        width = 1080,
        height = 640,
        autosize = false,
        legend = PlotlyBase.attr(
            x = 0.05,
            y = 0.93,
            bordercolor = "#000000",
            borderwidth = 2,
            font = PlotlyBase.attr(
                color = "#000000",
                family = "New Times Roman",
                size = 22,
            ),
        ),
        xaxis = PlotlyBase.attr(
            ticks = "inside",
            showline = true,
            range = [1, 50],
            mirror = true,
            zeroline = false,
            linewidth = 2,
            tickwidth = 2,
            showgrid = true,
            gridcolor = "#e6e6e6",
            tickfont = PlotlyBase.attr(
                color = "#000000",
                family = "New Times Roman",
                size = 22,
            ),
        ),
        yaxis = PlotlyBase.attr(
            ticks = "inside",
            showline = true,
            zeroline = false,
            range = [1, 100],
            mirror = true,
            linewidth = 2,
            tickwidth = 2,
            showgrid = true,
            gridcolor = "#e6e6e6",
            tickfont = PlotlyBase.attr(
                color = "#000000",
                family = "New Times Roman",
                size = 22,
            ),
        ),
    )
    config = Dict(:toImageButtonOptions => Dict(:format => "svg"))


    plot(trace, layout, options = config)
end
area1()