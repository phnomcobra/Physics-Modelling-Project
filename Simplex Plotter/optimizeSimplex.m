function data = optimizeSimplex(data)

for i = size(data.bumper, 2):-1:1
    for j = 1:i - 1
        if bumperRed(i, j, data)
            data.bumper(i) = [];
            
            break;
        end
    end
end

for i = 1:size(data.node, 2)
    for j = size(data.node(i).binders, 2):-1:1
        for k = 1:j - 1
            if data.node(i).binders(k) == data.node(i).binders(j)
                data.node(i).binders(j) = [];
                data.node(i).bdist(j)   = [];
                break;
            end
        end
    end
end
            

function c = bumperRed(a, b, data)

c = 0;

if data.bumper(a).nodes == data.bumper(b).nodes, c = c + 1;, end

data.bumper(a).nodes = [data.bumper(a).nodes(2) data.bumper(a).nodes(1)];

if data.bumper(a).nodes == data.bumper(b).nodes, c = c + 1;, end

