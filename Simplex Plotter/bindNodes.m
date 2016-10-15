%function data = bindNodes(data, a, b)
function data = bindNodes(data, varargin)

dist = sqrt((data.node(varargin{1} + 1).pos(1) - data.node(varargin{2} + 1).pos(1)) ^ 2 + ...
            (data.node(varargin{1} + 1).pos(2) - data.node(varargin{2} + 1).pos(2)) ^ 2 + ...
            (data.node(varargin{1} + 1).pos(3) - data.node(varargin{2} + 1).pos(3)) ^ 2);
     
switch length(varargin)
    case 2
        data.node(varargin{1} + 1).binders(size(data.node(varargin{1} + 1).binders, 2) + 1) = varargin{2};
        data.node(varargin{1} + 1).bdist(size(data.node(varargin{1} + 1).bdist, 2) + 1)     = dist;
        data.node(varargin{1} + 1).spring(size(data.node(varargin{1} + 1).spring, 2) + 1)   = 10;
        data.node(varargin{1} + 1).damper(size(data.node(varargin{1} + 1).damper, 2) + 1)   = .1;
        data.node(varargin{1} + 1).stretch(size(data.node(varargin{1} + 1).stretch, 2) + 1) = -1;
    case 5
        data.node(varargin{1} + 1).binders(size(data.node(varargin{1} + 1).binders, 2) + 1) = varargin{2};
        data.node(varargin{1} + 1).bdist(size(data.node(varargin{1} + 1).bdist, 2) + 1)     = dist;
        data.node(varargin{1} + 1).spring(size(data.node(varargin{1} + 1).spring, 2) + 1)   = varargin{3};
        data.node(varargin{1} + 1).damper(size(data.node(varargin{1} + 1).damper, 2) + 1)   = varargin{4};
        data.node(varargin{1} + 1).stretch(size(data.node(varargin{1} + 1).stretch, 2) + 1) = varargin{5};
    otherwise
        disp "bindNodes Failed"
end
        