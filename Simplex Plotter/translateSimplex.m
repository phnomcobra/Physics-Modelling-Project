function data = translateSimplex(data, x, y, z)

for i = 1:size(data.node, 2)
    data.node(i).pos = data.node(i).pos + [x y z];
end
    