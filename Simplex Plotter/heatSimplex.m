function data = heatSimplex(data, m)

for i = 1:size(data.node, 2)
    data.node(i).tmp = m;
end
