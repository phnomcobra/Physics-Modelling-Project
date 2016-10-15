function data = typeSimplex(data, m)

for i = 1:size(data.node, 2)
    data.node(i).type = m;
end
    