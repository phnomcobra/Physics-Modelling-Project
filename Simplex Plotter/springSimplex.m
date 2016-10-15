function data = springSimplex(data, x, y, z)

for i = 1:size(data.node, 2)
    for j = 1:size(data.node(i).bdist, 2) 
        data.node(i).spring(j)  = x;
        data.node(i).damper(j)  = y;
        data.node(i).stretch(j) = z;
    end
end