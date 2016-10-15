function data = createMesh(X, Y, scale)

firstPass = 1;

nodeMaster = loadSimplex('node.simplex');

for i = Y(1):Y(2)
    for j = X(1):X(2)
        if firstPass
            firstPass = 0;
            data = translateSimplex(nodeMaster, j * scale, i * scale, 0);
        else
            data = fuseSimplex(data, translateSimplex(nodeMaster, j * scale, i * scale, 0));
        end
    end
end

for i = Y(1):Y(2)
    for j = X(1):X(2)
        if j ~= X(1), data = bindNodes(data, index2nodeid(j - 1, i, X, Y), index2nodeid(j, i, X, Y));, end
        if j ~= X(2), data = bindNodes(data, index2nodeid(j + 1, i, X, Y), index2nodeid(j, i, X, Y));, end
        if i ~= Y(1), data = bindNodes(data, index2nodeid(j, i - 1, X, Y), index2nodeid(j, i, X, Y));, end
        if i ~= Y(2), data = bindNodes(data, index2nodeid(j, i + 1, X, Y), index2nodeid(j, i, X, Y));, end 
        
        if j ~= X(1), data = createBumper(data, index2nodeid(j - 1, i, X, Y), index2nodeid(j, i, X, Y));, end
        if j ~= X(2), data = createBumper(data, index2nodeid(j + 1, i, X, Y), index2nodeid(j, i, X, Y));, end
        if i ~= Y(1), data = createBumper(data, index2nodeid(j, i - 1, X, Y), index2nodeid(j, i, X, Y));, end
        if i ~= Y(2), data = createBumper(data, index2nodeid(j, i + 1, X, Y), index2nodeid(j, i, X, Y));, end 
             
        if (j ~= X(1) && i ~= Y(1)), data = bindNodes(data, index2nodeid(j - 1, i - 1, X, Y), index2nodeid(j, i, X, Y));, end
        if (j ~= X(2) && i ~= Y(1)), data = bindNodes(data, index2nodeid(j + 1, i - 1, X, Y), index2nodeid(j, i, X, Y));, end
        if (j ~= X(1) && i ~= Y(2)), data = bindNodes(data, index2nodeid(j - 1, i + 1, X, Y), index2nodeid(j, i, X, Y));, end
        if (j ~= X(2) && i ~= Y(2)), data = bindNodes(data, index2nodeid(j + 1, i + 1, X, Y), index2nodeid(j, i, X, Y));, end
    end
end

data = optimizeSimplex(data);

function nodeid = index2nodeid(x, y, X, Y)
nodeid = (X(2) - X(1) + 1) * (y - Y(1)) + (x - X(1)); 