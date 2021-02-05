using GLMakie
using AbstractPlotting.Colors

figure, ax, lineplot = lines(0..10, sin; linewidth=10)

# animation settings
n_frames = 30
framerate = 30
hue_iterator = LinRange(0, 360, n_frames)

record(figure, "color_animation.mp4", hue_iterator; framerate = framerate) do hue
    lineplot.color = HSV(hue, 1, 0.75)
end
