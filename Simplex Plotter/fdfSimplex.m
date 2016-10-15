function data = fdfSimplex(data, m)

for i = 1:size(data.node, 2)
    data.node(i).fdfCoef = m;
end
    