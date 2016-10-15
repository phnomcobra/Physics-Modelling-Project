function data = colorSimplex(data, x, y, z)

for i = 1:size(data.node, 2)
    data.node(i).color = [x y z];
end