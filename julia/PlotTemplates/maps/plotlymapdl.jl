using Dates
using DataFrames
using CSV
using PlotlyJS

t = now()
d = day(t) - 1;
m = month(t);
y = year(t);
if m != 11 || m != 12
    m = string(m)
    mm = "0$m"
else
    mm = string(m)
end

if d < 10
    d = string(d)
    dd = "0$d"
else
    dd = string(d)
end

url = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/$(mm)-$(dd)-$(y).csv"
temp = download(url, "data.csv")
url = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/$(mm)-$(dd)-$(y).csv"
temp = download(url, "data.csv")
con = DataFrame(CSV.File("data.csv"))
#rm("data.csv")
df = con[:, [3, 4, 6, 7, 8, 9, 10, 11]]

trace = scattergeo(
    lat = df[:Lat],
    lon = df[:Long_],
    hoverinfo = "text",
    text = [
        string(
            "Provincex: ",
            x[:Province_State],
            " Confirmed: ",
            x[:Confirmed],
            "Deaths :",
            x[:Deaths],
            "Recovered: ",
            x[:Recovered],
            "Active: ",
            x[:Active],
        ) for x in eachrow(df)
    ],
    marker_size = df[:Confirmed] / 5000,
    marker_line_color = "black",
    marker_line_width = 0,
    opacity = 0.5,
)

geo = attr(
    scope = "world",
    projection_type = "orthographic",
    showland = true,
    landcolor = "rgb(217, 217, 217)",
    subunitwidth = 1,
    countrywidth = 1,
    subunitcolor = "rgb(255,255,255)",
    countrycolor = "rgb(255,255,255)",
)

layout = Layout(; title = "2014 US City Populations", showlegend = false, geo = geo)
plot(trace, layout)