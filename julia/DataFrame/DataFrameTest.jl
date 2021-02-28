using DataFrames
using CSV
using DelimitedFiles

dataset1 = rand(Float64, 10, 3)
var_1    = DataFrame(index1=dataset1[:,1], 
                     index2=dataset1[:,2],
                     index3=dataset1[:,3],
                     index4=rand(["type_1", "type_2", "type_3"], 10))

CSV.write(joinpath(@__DIR__, "./Data/random.csv"), var_1)
a = hcat(CSV.File(joinpath(@__DIR__, "./Data/random.csv")).index1, 
         CSV.File(joinpath(@__DIR__, "./Data/random.csv")).index2, 
         CSV.File(joinpath(@__DIR__, "./Data/random.csv")).index3, 
         CSV.File(joinpath(@__DIR__, "./Data/random.csv")).index4)
