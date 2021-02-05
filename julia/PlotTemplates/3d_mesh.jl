#===========================================================#
#  General layout in a three-dimensional coordinate system  #
#  * author: Zenan Huo                                      #
#  * data  : 2020.05.25                                     #
#===========================================================#

using PlotlyJS
using ORCA

function mesh_eg()

    trace = PlotlyBase.mesh3d(
        x = [0, 1, 0, 0],
        y = [0, 0, 1, 0],
        z = [0, 0, 0, 1],
        i = [0, 0, 0, 1],
        j = [1, 1, 2, 2],
        k = [2, 3, 3, 3],
        colorscale = "Greys",
        showscale = false,
    )

    layout = Layout(
        width = 720,
        height = 640,
        autosize = false,
        margin = PlotlyBase.attr(l = 100, r = 100, b = 100, t = 40),
        scene = PlotlyBase.attr(
            xaxis = PlotlyBase.attr(
                gridcolor = "rgb(255, 255, 255)",
                #zerolinecolor  = "rgb(255, 255, 255)",
                zeroline = false,
                showbackground = true,
                backgroundcolor = "rgb(230, 230,230)",
                tickfont = PlotlyBase.attr(color = "#000000", family = "New Times Roman"),
                titlefont = PlotlyBase.attr(color = "#000000", family = "New Times Roman"),
                title = "X AXIS TITLE",
            ),
            yaxis = PlotlyBase.attr(
                gridcolor = "rgb(255, 255, 255)",
                #zerolinecolor  = "rgb(255, 255, 255)",
                zeroline = false,
                showbackground = true,
                backgroundcolor = "rgb(230, 230,230)",
                tickfont = PlotlyBase.attr(color = "#000000", family = "New Times Roman"),
                titlefont = PlotlyBase.attr(color = "#000000", family = "New Times Roman"),
                title = "Y AXIS TITLE",
            ),
            zaxis = PlotlyBase.attr(
                gridcolor = "rgb(255, 255, 255)",
                #zerolinecolor  = "rgb(255, 255, 255)",
                zeroline = false,
                showbackground = true,
                backgroundcolor = "rgb(230, 230,230)",
                tickfont = PlotlyBase.attr(color = "#000000", family = "New Times Roman"),
                titlefont = PlotlyBase.attr(color = "#000000", family = "New Times Roman"),
                title = "Z AXIS TITLE",
            ),
            aspectratio = PlotlyBase.attr(x = 1, y = 1, z = 1),
            aspectmode = "manual",
            camera = PlotlyBase.attr(
                center = PlotlyBase.attr(x = 0, y = 0, z = 0),
                eye = PlotlyBase.attr(x = 1.25, y = 1.25, z = 1.25),
                up = PlotlyBase.attr(x = 0, y = 0, z = 1),
            ),
        ),
    )
    plot(trace, layout)
    #p = Plot(trace, layout)
    #savefig(p, "E://GitHub//sphere.svg")
end