using PlotlyJS

function scatter_dy(snum::Int64 = 10, steps::Int64 = 10)

    colors = ["hsl($i, 50%, 50%)" for i in range(0, stop = 360, length = snum)]

    a = rand(1.0:1.0:100.0, snum)
    A = zeros(Float64, snum, steps)
    A[:, 1] = a
    b = rand(1.0:1.0:100.0, snum)
    B = zeros(Float64, snum, steps)
    B[:, 1] = b
    c = rand(1.0:1.0:100.0, snum)
    C = zeros(Float64, snum, steps)
    C[:, 1] = c

    for i = 2:steps
        A[:, i] = A[:, i-1] - rand(0.0:2.0:10.0, snum)
        B[:, i] = B[:, i-1] - rand(0.0:2.0:15.0, snum)
        C[:, i] = C[:, i-1] - rand(0.0:2.0:15.0, snum)
    end

    trace = AbstractTrace[]
    initial = scatter3d(
        x = A[:, 1],
        y = B[:, 1],
        z = C[:, 1],
        mode = "markers",
        marker_color = colors,
        colorscale = "RdBu",
        showscale = false,
    )
    push!(trace, initial)

    layout = Layout(
        width = 650,
        height = 480,
        autosize = false,
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

    plot(trace, layout)

    for i = 2:steps
        trace = AbstractTrace[]
        initial = scatter3d(
            x = A[:, i],
            y = B[:, i],
            z = C[:, i],
            mode = "markers",
            marker_color = colors,
            colorscale = "RdBu",
            showscale = false,
        )
        push!(trace, initial)

        layout = Layout(
            width = 650,
            height = 480,
            autosize = false,
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

        PlotlyJS.react!(plot(trace), trace, layout)
        sleep(0.2)
    end
end

scatter_dy()