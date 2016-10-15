function data = accSimplex(data, x, y, z)

for i = 1:size(data.node, 2)
    data.node(i).acc = data.node(i).acc + [x y z];
end