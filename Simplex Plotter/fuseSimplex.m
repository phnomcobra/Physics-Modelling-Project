function data = fuseSimplex(varargin)

data = varargin{1};

for i = 2:length(varargin) 
    numNodes = size(data.node, 2);
    numBumps = size(data.bumper, 2);
    
    newData = varargin{i};
    
    for j = 1:size(newData.node, 2)
        newData.node(j).binders = newData.node(j).binders + numNodes; 
    end
    
    for j = 1:size(newData.cont, 2)
        if newData.cont(j).data(1, 1) ~= -1, newData.cont(j).data(1, 1) = newData.cont(j).data(1, 1) + numNodes;, end
        if newData.cont(j).data(1, 2) ~= -1, newData.cont(j).data(1, 2) = newData.cont(j).data(1, 2) + numNodes;, end
        if newData.cont(j).data(1, 3) ~= -1, newData.cont(j).data(1, 3) = newData.cont(j).data(1, 3) + numNodes;, end
    end
    
    for j = 1:size(newData.bumper, 2)
        newData.bumper(j).nodes  = newData.bumper(j).nodes + numNodes;
    end    
    
    for j = 1:size(newData.node, 2)
        try
            data.node(size(data.node, 2) + 1) = newData.node(j);
        catch
            data.node = newData.node(j);
        end
    end

    for j = 1:size(newData.cont, 2)
        try
            data.cont(size(data.cont, 2) + 1) = newData.cont(j);
        catch
            data.cont = newData.cont(j);
        end
    end
    
    for j = 1:size(newData.bumper, 2)
        try
            data.bumper(size(data.bumper, 2) + 1) = newData.bumper(j);
        catch
            data.bumper = newData.bumper(j);
        end
    end
end        