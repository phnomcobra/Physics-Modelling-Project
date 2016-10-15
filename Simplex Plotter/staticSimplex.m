function data = staticSimplex(data, x)

for i = 1:size(data.node, 2)
    data.node(i).static = x;
end
    