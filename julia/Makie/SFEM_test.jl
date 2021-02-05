using GLMakie
using AbstractPlotting
using .JuSFEM

#const force = -2500.0
const force = -8000.0

data = loadmesh("1576.facein", "1576.faceout", "1576.node", "1576.ele", "1576.cen")
I, J, V = sfem(data)
K, P = equation(I, J, V, force, data.node)
result = ju_solver(K, P, :P)

dataset = data.node' + result
faces = vcat(data.facein', data.faceout')
#faces   = data.faceout'

scene = mesh(dataset, faces; colormap=:seaborn_rocket_gradient, color=result[:, 3],
             shading=false, interpolate=true, specular=0, diffuse=0, backgroundcolor=:black,
             show_axis=true, # show axes or not
             show_legend=true)   = true)