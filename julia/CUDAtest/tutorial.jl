using CUDA
using BenchmarkTools

N = 2^20

function CPU_test(N)
    x = fill(1.0f0, N)  # a vector filled with 1.0 (Float32)
    y = fill(2.0f0, N)  # a vector filled with 2.0

    y .+= x
    return y
end

function GPU_test(N)
    x_d = CUDA.fill(1.0f0, N)  # a vector stored on the GPU filled with 1.0 (Float32)
    y_d = CUDA.fill(2.0f0, N)  # a vector stored on the GPU filled with 2.0

    y_d .+= x_d
    return y_d
end

@btime CPU_test($N)
@btime GPU_test($N)