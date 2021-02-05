using LinearAlgebra
using TetGen
let
    tetunsuitable() do pa, pb, pc, pd
        vol = det(hcat(pb - pa, pc - pa, pd - pa)) / 6
        center = 0.25 * (pa + pb + pc + pd) - [0.5, 0.5, 0.5]
        return vol > 0.05 * norm(center)^2.5
    end

    input = TetGen.RawTetGenIO{Cdouble}()
    input.pointlist = [
        0 0 0
        1 0 0
        1 1 0
        0 1 0
        0 0 1
        1 0 1
        1 1 1
        0 1 1
    ]'

    TetGen.facetlist!(input, [
                          1 2 3 4
                          5 6 7 8
                          1 2 6 5
                          2 3 7 6
                          3 4 8 7
                          4 1 5 8
                      ]')
    tetrahedralize(input, "pQa")
end