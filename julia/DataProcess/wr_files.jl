using DelimitedFiles

data1 = readdlm(joinpath(@__DIR__, "data.csv"), ',', Float64)
data2 = readdlm(joinpath(@__DIR__, "data.txt"), '\t', Float64)

data3 = rand(1.0:0.1:5.0, 10, 10)
open(joinpath(@__DIR__, "data3.csv"), "w") do io # "w"->write; "a"->append
    writedlm(io, data3, ',')
end
open(joinpath(@__DIR__, "data3.txt"), "w") do io # "w"->write; "a"->append
    writedlm(io, data3, '\t')
end