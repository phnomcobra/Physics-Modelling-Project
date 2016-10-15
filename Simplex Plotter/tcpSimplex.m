function data = tcpSimplex(data, m)

for i = 1:size(data.node, 2)
    data.node(i).tcp = m;
end
