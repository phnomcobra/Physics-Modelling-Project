function data = terSimplex(data, m)

for i = 1:size(data.node, 2)
    data.node(i).ter = m;
end
