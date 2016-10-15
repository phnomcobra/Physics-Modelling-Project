function data = attSimplex(data, m)

for i = 1:size(data.node, 2)
    data.node(i).attCoef = m;
end
    