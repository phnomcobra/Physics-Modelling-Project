function saveSimplex(varargin)

fid  = fopen(varargin{1}, 'w');
data = varargin{2};

fprintf(fid, '%i\n', size(data.node, 2));
for i = 1:size(data.node, 2)
    fprintf(fid, '%f %f %f\n', [data.node(i).pos(1) data.node(i).pos(2) data.node(i).pos(3)]);
    fprintf(fid, '%f %f %f\n', [data.node(i).vel(1) data.node(i).vel(2) data.node(i).vel(3)]);
    fprintf(fid, '%f %f %f\n', [data.node(i).acc(1) data.node(i).acc(2) data.node(i).acc(3)]);
    fprintf(fid, '%f %f %f\n', [data.node(i).frc(1) data.node(i).frc(2) data.node(i).frc(3)]);
    
    fprintf(fid, '%f %f %f\n', [data.node(i).tmp data.node(i).tcp data.node(i).ter]);
    
    fprintf(fid, '%f\n', data.node(i).mas);
    
    fprintf(fid, '%f\n', data.node(i).rad);
    
    fprintf(fid, '%f\n', data.node(i).attCoef);
    
    fprintf(fid, '%f\n', data.node(i).drgCoef);
    
    fprintf(fid, '%f\n', data.node(i).fdfCoef);
    
    fprintf(fid, '%i\n', data.node(i).static);
    
    fprintf(fid, '%i\n', data.node(i).type);
    
    fprintf(fid, '%i\n', data.node(i).rbm);
    
    fprintf(fid, '%f %f %f\n', [data.node(i).normal(1) data.node(i).normal(2) data.node(i).normal(3)]);
    
    fprintf(fid, '%f %f %f\n', [data.node(i).color(1) data.node(i).color(2) data.node(i).color(3)]);
    
    fprintf(fid, '%i\n', size(data.node(i).binders, 2));
    for j = 1:size(data.node(i).binders, 2)
        fprintf(fid, '%i %f %f %f %f\n', data.node(i).binders(j), data.node(i).bdist(j), data.node(i).spring(j), data.node(i).damper(j), data.node(i).stretch(j));
    end
end

fprintf(fid, '%i\n', size(data.cont, 2));
for i = 1:size(data.cont, 2)
    fprintf(fid, '%i %i %i %f %f %f %f %f %f %f %f %f\n', ...
            data.cont(i).data(1),  data.cont(i).data(2),  data.cont(i).data(3), ...
            data.cont(i).data(4),  data.cont(i).data(5),  data.cont(i).data(6), ...
            data.cont(i).data(7),  data.cont(i).data(8),  data.cont(i).data(9), ...
            data.cont(i).data(10), data.cont(i).data(11), data.cont(i).data(12));
end

fprintf(fid, '%i\n', size(data.bumper, 2));
for i = 1:size(data.bumper, 2)
    fprintf(fid, '%i %i\n', data.bumper(i).nodes(1), data.bumper(i).nodes(2));
end

fclose(fid);