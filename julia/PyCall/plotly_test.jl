using PyCall
pt = pyimport("plotly.express")
po = pyimport("plotly.offline")
go = pyimport("plotly.graph_objs")

po.plot(
    [
        "data":[go.Scatter(x = [1, 2, 3, 4], y = [4, 3, 2, 1])],
        "layout":go.Layout(title = "hello world"),
    ],
    image = "jpeg",
    image_filename = "test",
)="jpeg", image_filename="test")