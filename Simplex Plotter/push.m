function simplex = push(simplex, n, b, a, p)
if b == -1
    v = [0 0 0] - simplex.node(a + 1).pos;
elseif b == -2
    v = [0 0 1000] - simplex.node(a + 1).pos;
elseif b == -3
    v = [0 0 -1000] - simplex.node(a + 1).pos;
elseif b == -4
    v = [1000 0 0] - simplex.node(a + 1).pos;
elseif b == -5
    v = [-1000 0 0] - simplex.node(a + 1).pos;
elseif b == -6
    v = [0 1000 0] - simplex.node(a + 1).pos;
elseif b == -7
    v = [0 -1000 0] - simplex.node(a + 1).pos;
else
    v = simplex.node(b + 1).pos - simplex.node(a + 1).pos;
end
v = v ./ sqrt(v(1) ^ 2 + v(2) ^ 2 + v(3) ^ 2);
simplex.node(n + 1).normal = v * p;