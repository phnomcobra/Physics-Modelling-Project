function render(varargin)

fid = fopen(varargin{1});

buffer = fgetl(fid);
numNodes = sscanf(buffer, '%i');
k = 0; binders = [];
for i = 1:numNodes
    buffer = fgetl(fid);
    nodes(:, i) = sscanf(buffer, '%f %f %f');
 
    buffer = fgetl(fid);
    buffer = fgetl(fid);
    buffer = fgetl(fid);
    buffer = fgetl(fid);
    buffer = fgetl(fid);
    
    buffer = fgetl(fid);
    radii(i) = sscanf(buffer, '%f');
    
    buffer = fgetl(fid);
    buffer = fgetl(fid);
    buffer = fgetl(fid);
    buffer = fgetl(fid);
    buffer = fgetl(fid);
    buffer = fgetl(fid);
    buffer = fgetl(fid);
    
    buffer = fgetl(fid);
    cOlors{i} = sscanf(buffer, '%f %f %f');
    
    buffer = fgetl(fid);
    numBinders = sscanf(buffer, '%i');
    for j = 1:numBinders
        buffer = fgetl(fid);
        data = sscanf(buffer, '%i %f');
        k = k + 1;
        binders(k).p1 = i;
        binders(k).p2 = data(1);
    end
end

buffer = fgetl(fid);
numCont = sscanf(buffer, '%i');
for i = 1:numCont
    buffer = fgetl(fid);
    face   = sscanf(buffer, '%i %i %i %f %f %f %f %f %f %f %f %f');

    if face(1) == -1
        patch(face(4:6), face(7:9), face(10:12), [0 1 1], 'FaceAlpha', .2, 'EdgeColor', [1 1 0], 'EdgeAlpha', .2);
    else
        patch([nodes(1, face(1) + 1) nodes(1, face(2) + 1) nodes(1, face(3) + 1)], ...
              [nodes(2, face(1) + 1) nodes(2, face(2) + 1) nodes(2, face(3) + 1)], ...
              [nodes(3, face(1) + 1) nodes(3, face(2) + 1) nodes(3, face(3) + 1)], ...
              [0 1 1], 'FaceAlpha', .2, 'EdgeColor', [0 1 1], 'EdgeAlpha', .2);
    end
end

buffer = fgetl(fid);
numBumpers = sscanf(buffer, '%i');
for i = 1:numBumpers
    buffer = fgetl(fid);
    bpts   = sscanf(buffer, '%i %i');
    bpts   = bpts + 1;
    
    c = cOlors{bpts(1)};
    c = c + cOlors{bpts(2)};
    c = c / 2;
    
    line([nodes(1, bpts(1)) nodes(1, bpts(2))], [nodes(2, bpts(1)) nodes(2, bpts(2))], [nodes(3, bpts(1)) nodes(3, bpts(2))], 'Color', c, 'LineWidth', 1.5);
end



for i = 1:length(binders)
    c = cOlors{binders(i).p1};
    c = c + cOlors{binders(i).p2 + 1};
    c = c / 2;
    
    line([nodes(1, binders(i).p1) nodes(1, binders(i).p2 + 1)], ...
         [nodes(2, binders(i).p1) nodes(2, binders(i).p2 + 1)], ...
         [nodes(3, binders(i).p1) nodes(3, binders(i).p2 + 1)], 'Color', c, 'LineStyle', ':');
end


for i = 1:numNodes
    x = nodes(1, i); y = nodes(2, i); z = nodes(3, i);
    line([x+radii(i) x-radii(i)], [y+0 y-0], [z+0 z-0], 'Color', cOlors{i});
    line([x+0 x-0], [y+radii(i) y-radii(i)], [z+0 z-0], 'Color', cOlors{i});
    line([x+0 x-0], [y+0 y-0], [z+radii(i) z-radii(i)], 'Color', cOlors{i});
end

fclose(fid);