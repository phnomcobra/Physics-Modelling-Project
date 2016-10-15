function data = massSimplex(data, m)

for i = 1:size(data.node, 2)
    data.node(i).mas = m;
end
    