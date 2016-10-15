function data = scaleSimplex(data, s)

for i = 1:size(data.node, 2)
    data.node(i).pos = data.node(i).pos .* s;
    
    for j = 1:size(data.node(i).bdist, 2)
        data.node(i).bdist(j) = data.node(i).bdist(j) .* s;
    end
end