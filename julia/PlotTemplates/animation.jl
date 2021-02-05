using PlotlyJS
using ORCA

function giftest()
    X = [0]
    Y = [0]
    trace_1 = scatter(x = X, y = Y)
    layout2 = Layout(
        title = "START",
        width = 650,
        height = 480,
        autosize = false,
        xaxis_range = [-10, 11],
        yaxis_range = [-10, 11],
    )
    p1 = Plot(trace_1, layout2)

    for i = 1:50
        trace_x = scatter(x = append!(X, rand(-4:5, 1)), y = append!(Y, rand(-2:6, 1)))
        layout = Layout(
            title = "PLOT $i",
            width = 650,
            height = 480,
            autosize = false,
            xaxis_range = [-10, 11],
            yaxis_range = [-10, 11],
        )
        p2 = Plot(trace_x, layout)

        react!(p1, p2.data, p2.layout)
        savefig(p1, "E://GitHub//Notebook//Julia//$i.png")
    end
end

function giftest1()
    X = [1]
    Y = [1]
    trace_1 = scatter(x = X, y = Y)
function giftest1()
    X = [1]
    Y = [1]
    trace_1 = scatter(x = X, y = Y)
    layout2 = Layout(
        title = "START",
        width = 650,
        height = 480,
        autosize = false,
        xaxis_range = [-10, 11],
        yaxis_range = [-10, 11],
    )
    plot(trace_1, layout2)
end