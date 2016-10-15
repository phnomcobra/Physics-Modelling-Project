function data = normalSimplex(data, x, y, z)

for i = 1:size(data.node, 2)
    data.node(i).normal = data.node(i).normal + [x y z];
end