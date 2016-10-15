function data = moveSimplex(data, x, y, z)

for i = 1:size(data.node, 2)
    data.node(i).vel = data.node(i).vel + [x y z];
end
    