function data = loadSimplex(varargin)

fid = fopen(varargin{1});

buffer = fgetl(fid);
numNodes = sscanf(buffer, '%i');
if numNodes == 0, data.node = [];, end
for i = 1:numNodes
    buffer = fgetl(fid);
    values = sscanf(buffer, '%f %f %f');
    data.node(i).pos = [values(1) values(2) values(3)];
    
    buffer = fgetl(fid);
    values = sscanf(buffer, '%f %f %f');
    data.node(i).vel = [values(1) values(2) values(3)];
    
    buffer = fgetl(fid);
    values = sscanf(buffer, '%f %f %f');
    data.node(i).acc = [values(1) values(2) values(3)];
    
    buffer = fgetl(fid);
    values = sscanf(buffer, '%f %f %f');
    data.node(i).frc = [values(1) values(2) values(3)];
    
    buffer = fgetl(fid);
    values = sscanf(buffer, '%f %f %f');
    data.node(i).tmp = values(1);
    data.node(i).tcp = values(2);
    data.node(i).ter = values(3);
    
    buffer = fgetl(fid);
    data.node(i).mas = sscanf(buffer, '%f');    
    
    buffer = fgetl(fid);
    data.node(i).rad = sscanf(buffer, '%f');
    
    buffer = fgetl(fid);
    data.node(i).attCoef = sscanf(buffer, '%f');
    
    buffer = fgetl(fid);
    data.node(i).drgCoef = sscanf(buffer, '%f');
    
    buffer = fgetl(fid);
    data.node(i).fdfCoef = sscanf(buffer, '%f');
    
    buffer = fgetl(fid);
    data.node(i).static = sscanf(buffer, '%f');
    
    buffer = fgetl(fid);
    data.node(i).type = sscanf(buffer, '%f');
    
    buffer = fgetl(fid);
    data.node(i).rbm = sscanf(buffer, '%f');
    
    buffer = fgetl(fid);
    values = sscanf(buffer, '%f %f %f');
    data.node(i).normal = [values(1) values(2) values(3)];
    
    buffer = fgetl(fid);
    values = sscanf(buffer, '%f %f %f');
    data.node(i).color = [values(1) values(2) values(3)];
    
    buffer = fgetl(fid);
    numBinders = sscanf(buffer, '%i');
    if numBinders == 0, data.node(i).binders = [];, end
    if numBinders == 0, data.node(i).bdist   = [];, end
    if numBinders == 0, data.node(i).spring  = [];, end
    if numBinders == 0, data.node(i).damper  = [];, end
    if numBinders == 0, data.node(i).stretch = [];, end
    for j = 1:numBinders
        buffer  = fgetl(fid);
        values = sscanf(buffer, '%i %f %f %f %f');
        
        data.node(i).binders(j) = values(1);
        data.node(i).bdist(j)   = values(2);        
        data.node(i).spring(j)  = values(3);        
        data.node(i).damper(j)  = values(4);        
        data.node(i).stretch(j) = values(5);        
    end
end

buffer = fgetl(fid);
numCont = sscanf(buffer, '%i');
if numCont == 0, data.cont = [];, end
for i = 1:numCont
    buffer = fgetl(fid);
    values = sscanf(buffer, '%i %i %i %f %f %f %f %f %f %f %f %f');
    data.cont(i).data = [values(1) values(2) values(3) values(4) values(5) values(6) values(7) values(8) values(9) values(10) values(11) values(12)];
end

buffer = fgetl(fid);
numBumpers = sscanf(buffer, '%i');
if numBumpers == 0, data.bumper = [];, end
for i = 1:numBumpers
    buffer  = fgetl(fid);
    values = sscanf(buffer, '%i %i');
    data.bumper(i).nodes = [values(1) values(2)];
end

fclose(fid);