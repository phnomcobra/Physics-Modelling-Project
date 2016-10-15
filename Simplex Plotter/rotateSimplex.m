function data = rotateSimplex(data, alpha, theta, phi)

for i = 1:size(data.node, 2)
    x = data.node(i).pos(1);
    y = data.node(i).pos(2);
    
    xN = x * cos(alpha) - y * sin(alpha);
    yN = y * cos(alpha) + x * sin(alpha);
    
    data.node(i).pos(1) = xN;
    data.node(i).pos(2) = yN;
end

for i = 1:size(data.node, 2)
    x = data.node(i).pos(2);
    y = data.node(i).pos(3);
    
    xN = x * cos(theta) - y * sin(theta);
    yN = y * cos(theta) + x * sin(theta);
    
    data.node(i).pos(2) = xN;
    data.node(i).pos(3) = yN;
end

for i = 1:size(data.node, 2)
    x = data.node(i).pos(3);
    y = data.node(i).pos(1);
    
    xN = x * cos(phi) - y * sin(phi);
    yN = y * cos(phi) + x * sin(phi);
    
    data.node(i).pos(3) = xN;
    data.node(i).pos(1) = yN;
end