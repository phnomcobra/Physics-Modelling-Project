function data = drgSimplex(data, m)

for i = 1:size(data.node, 2)
    data.node(i).drgCoef = m;
end
    