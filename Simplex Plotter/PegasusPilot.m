function data = PegasusPilot(data, r, varargin)

for i = 1:length(varargin)
    if strcmp(varargin{i}, 'reset')
        data = reset(data, r, varargin{i + 1}, varargin{i + 2}, varargin{i + 3});
    end
    if strcmp(varargin{i}, 'stabilize')
        data = stabilize(data, r, varargin{i + 1});
    end    
    if strcmp(varargin{i}, 'hover')
        data = hover(data, r, varargin{i + 1});
    end
    if strcmp(varargin{i}, 'roll')
        data = roll(data, r, varargin{i + 1});
    end
    if strcmp(varargin{i}, 'pitch')
        data = pitch(data, r, varargin{i + 1});
    end
    if strcmp(varargin{i}, 'yaw')
        data = yaw(data, r, varargin{i + 1});
    end
    if strcmp(varargin{i}, 'forward')
        data = forward(data, r, varargin{i + 1});
    end

end




function data = reset(data, r, x, y, z)

for n = 1:43
    data.node(r + n).normal(1) = x;
    data.node(r + n).normal(2) = y;
    data.node(r + n).normal(3) = z;
end




function data = stabilize(data, r, i)


s0 = data.node(r + 40).pos(3) - data.node(r + 42).pos(3);
s1 = data.node(r + 40).pos(3) - data.node(r + 42).pos(3) + data.node(r + 40).vel(3) - data.node(r + 42).vel(3);
rt0 = s1 - s0;
if rt0 > 0
    rt0 = 0;
end
rt1 = s0 - s1;
if rt1 > 0
    rt1 = 0;
end

if(data.node(r + 40).pos(3) > data.node(r + 42).pos(3))
    data = roll(data, r, -i * exp(10 * rt0));
elseif(data.node(r + 40).pos(3) < data.node(r + 42).pos(3))
    data = roll(data, r, i * exp(10 * rt1));
end

s0 = data.node(r + 3).pos(3) - data.node(r + 15).pos(3);
s1 = data.node(r + 3).pos(3) - data.node(r + 15).pos(3) + data.node(r + 3).vel(3) - data.node(r + 15).vel(3);
rt = s1 - s0;
rt0 = s1 - s0;
if rt0 > 0
    rt0 = 0;
end
rt1 = s0 - s1;
if rt1 > 0
    rt1 = 0;
end

if(data.node(r + 11).pos(3) > data.node(r + 15).pos(3))
    data = pitch(data, r, -i * exp(10 * rt0));
elseif(data.node(r + 11).pos(3) < data.node(r + 15).pos(3))
    data = pitch(data, r, i * exp(10 * rt1));
end




function data = roll(data, r, i)

v = cross(data.node(r + 40).pos - data.node(r + 41).pos, data.node(r + 40).pos - data.node(r + 38).pos);
v0 = v / sqrt(dot(v, v));

v = cross(data.node(r + 42).pos - data.node(r + 43).pos, data.node(r + 42).pos - data.node(r + 39).pos);
v1 = v / sqrt(dot(v, v));

data.node(r + 40).normal = data.node(r + 40).normal + v0 * i;
data.node(r + 42).normal = data.node(r + 42).normal + v1 * i;




function data = pitch(data, r, i)

v = cross(data.node(r + 40).pos - data.node(r + 41).pos, data.node(r + 40).pos - data.node(r + 38).pos);
v0 = v / sqrt(dot(v, v));

v = cross(data.node(r + 42).pos - data.node(r + 43).pos, data.node(r + 42).pos - data.node(r + 39).pos);
v1 = v / sqrt(dot(v, v));

data.node(r + 41).normal =  data.node(r + 41).normal + v0 * -i;
data.node(r + 43).normal =  data.node(r + 43).normal + v1 * i;
data.node(r + 1).normal  =  data.node(r + 1).normal  + v0 * i;
data.node(r + 2).normal  =  data.node(r + 2).normal  + v1 * -i;




function data = forward(data, r, i)

v = data.node(r + 15).pos - data.node(r + 11).pos;
v0 = v / sqrt(dot(v, v));

data.node(r + 9).normal  = data.node(r + 9).normal  - v0 * i;
data.node(r + 10).normal = data.node(r + 10).normal - v0 * i;
data.node(r + 15).normal = data.node(r + 15).normal - v0 * i;




function data = yaw(data, r, i)

v = data.node(r + 5).pos - data.node(r + 6).pos;
v0 = v / sqrt(dot(v, v));

data.node(r + 7).normal  = data.node(r + 7).normal  + v0 * i;
data.node(r + 8).normal  = data.node(r + 8).normal  + v0 * i;
data.node(r + 14).normal = data.node(r + 14).normal + v0 * i;

data.node(r + 4).normal  = data.node(r + 4).normal  - v0 * i;
data.node(r + 3).normal  = data.node(r + 3).normal  - v0 * i;
data.node(r + 12).normal = data.node(r + 12).normal - v0 * i;




function data = hover(data, r, i)

v = cross(data.node(r + 5).pos - data.node(r + 6).pos, data.node(r + 6).pos - data.node(r + 7).pos);
v0 = v / sqrt(dot(v, v));

for n = 1:43
    data.node(r + n).normal = data.node(r + n).normal + (v0 * -i);
end