using PlotlyJS

mapbox_access_token = "pk.eyJ1IjoiZWxsaW90aHVvemVub24iLCJhIjoiY2thODg5cjltMGFkaTJ6cDRrZ2xodnBwNCJ9.6V_BYFRXpIfdWiicmbbYyA"


layout = Layout(
    title = "RANDOM MAP",
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

plot(layout)