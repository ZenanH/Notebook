using Dates
using DataFrames
using CSV
using PlotlyJS

con = DataFrame(CSV.File("E://GitHub//Notebook//Julia//PlotTemplates//maps//data.csv"))
# rm("data.csv")
df = con[:, [3, 4, 6, 7, 8, 9, 10, 11]]
mapbox_access_token = "pk.eyJ1IjoiZWxsaW90aHVvemVub24iLCJhIjoiY2thODg5cjltMGFkaTJ6cDRrZ2xodnBwNCJ9.6V_BYFRXpIfdWiicmbbYyA"

trace = PlotlyBase.scattermapbox(
    lat = df[:Lat],
    lon = df[:Long_],
    hoverinfo = "text",
    text = [
        (
            "Provincex: $(x[:Province_State])<br>Confirmed: $(x[:Confirmed])<br>Deaths : $(x[:Deaths])<br>Recovered: $(x[:Recovered])<br>Active: $(x[:Active])"
        ) for x in eachrow(df)
    ],
    marker_size = map(x -> x < 8 ? 8 : x, df[:Confirmed] / 3000),
    marker_line_color = "black",
    marker_line_width = 0,
    opacity = 0.7,
    marker_color = "red",
)

"""
geo = PlotlyJS.attr(scope           = "world",
                    projection_type = "hammer",
                    showland        = true,
                    landcolor       = "rgb(217, 217, 217)",
                    subunitwidth    = 1,
                    countrywidth    = 1,
                    subunitcolor    = "rgb(255,255,255)",
                    countrycolor    = "rgb(255,255,255)")
"""

layout = Layout(title        = "COVID-19 2020-05-11",
                autosize     = true, 
                    subunitcolor    = "rgb(255,255,255)",
                    countrycolor    = "rgb(255,255,255)")
"""

layout = Layout(
    title = "COVID-19 2020-05-11",
    autosize = true,
    hovermode = "closest",
    mapbox_style = "dark",
    mapbox = PlotlyBase.attr(
        accesstoken = mapbox_access_token,
        bearing = 0,
        center_lat = 45,
        center_lon = -73,
        pitch = 0,
        zoom = 5,
    ),
)

plot(trace, layout)