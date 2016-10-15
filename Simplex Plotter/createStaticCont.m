function data = createStaticCont(data, x, y, z)

data.cont(size(data.cont, 2) + 1).data = [-1 -1 -1 x y z];