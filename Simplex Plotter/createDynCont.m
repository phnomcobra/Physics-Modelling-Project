function data = createDynCont(data, a, b, c)

data.cont(size(data.cont, 2) + 1).data = [a b c 0 0 0 0 0 0 0 0 0];