function Rotor

inc = .1;

part = loadSimplex('node.simplex');

model =                    translateSimplex(part, 0,  -100,   0);
model = fuseSimplex(model, translateSimplex(part, 0,   100,   0));
model = staticSimplex(model, 1);

count = 2;

r = translateSimplex(part, 0,  -100,  10);
ring = r;
k = 1; count = count + 1; ringLookup(1).index(k) = count; 
for i = inc:inc:1 - inc
    count = count + 1;
    k = k + 1;
    ringLookup(1).index(k) = count;  
    ring = fuseSimplex(ring, rotateSimplex(r, 0, 0, i * pi * 2));
end
model = fuseSimplex(model, ring);

r = translateSimplex(part, 0,  -60,  10);
ring = r;
k = 1; count = count + 1; ringLookup(2).index(k) = count; 
for i = inc:inc:1 - inc
    count = count + 1;
    k = k + 1;
    ringLookup(2).index(k) = count; 
    ring = fuseSimplex(ring, rotateSimplex(r, 0, 0, i * pi * 2));
end
model = fuseSimplex(model, ring);

r = translateSimplex(part, 0,  -60,  30);
ring = r;
k = 1; count = count + 1; ringLookup(3).index(k) = count; 
for i = inc:inc:1 - inc
    count = count + 1;
    k = k + 1;
    ringLookup(3).index(k) = count; 
    ring = fuseSimplex(ring, rotateSimplex(r, 0, 0, i * pi * 2));
end
model = fuseSimplex(model, ring);

r = translateSimplex(part, 0,  -50,  30);
ring = r;
k = 1; count = count + 1; ringLookup(4).index(k) = count; 
for i = inc:inc:1 - inc
    count = count + 1;
    k = k + 1;
    ringLookup(4).index(k) = count; 
    ring = fuseSimplex(ring, rotateSimplex(r, 0, 0, i * pi * 2));
end
model = fuseSimplex(model, ring);

r = translateSimplex(part, 0,  -50,  60);
ring = r;
k = 1; count = count + 1; ringLookup(5).index(k) = count; 
for i = inc:inc:1 - inc
    count = count + 1;
    k = k + 1;
    ringLookup(5).index(k) = count; 
    ring = fuseSimplex(ring, rotateSimplex(r, 0, 0, i * pi * 2));
end
model = fuseSimplex(model, ring);

r = translateSimplex(part, 0,  -40,  60);
ring = r;
k = 1; count = count + 1; ringLookup(6).index(k) = count; 
for i = inc:inc:1 - inc
    count = count + 1;
    k = k + 1;
    ringLookup(6).index(k) = count; 
    ring = fuseSimplex(ring, rotateSimplex(r, 0, 0, i * pi * 2));
end
model = fuseSimplex(model, ring);

r = translateSimplex(part, 0,  -40,  120);
ring = r;
k = 1; count = count + 1; ringLookup(7).index(k) = count; 
for i = inc:inc:1 - inc
    count = count + 1;
    k = k + 1;
    ringLookup(7).index(k) = count; 
    ring = fuseSimplex(ring, rotateSimplex(r, 0, 0, i * pi * 2));
end
model = fuseSimplex(model, ring);

r = translateSimplex(part, 0,  -30,  120);
ring = r;
k = 1; count = count + 1; ringLookup(8).index(k) = count; 
for i = inc:inc:1 - inc
    count = count + 1;
    k = k + 1;
    ringLookup(8).index(k) = count; 
    ring = fuseSimplex(ring, rotateSimplex(r, 0, 0, i * pi * 2));
end
model = fuseSimplex(model, ring);

r = translateSimplex(part, 0,  -30,  60);
ring = r;
k = 1; count = count + 1; ringLookup(9).index(k) = count; 
for i = inc:inc:1 - inc
    count = count + 1;
    k = k + 1;
    ringLookup(9).index(k) = count; 
    ring = fuseSimplex(ring, rotateSimplex(r, 0, 0, i * pi * 2));
end
model = fuseSimplex(model, ring);

r = translateSimplex(part, 0,  100,  10);
ring = r;
k = 1; count = count + 1; ringLookup(10).index(k) = count; 
for i = inc:inc:1 - inc
    count = count + 1;
    k = k + 1;
    ringLookup(10).index(k) = count; 
    ring = fuseSimplex(ring, rotateSimplex(r, 0, 0, i * pi * 2));
end
model = fuseSimplex(model, ring);

r = translateSimplex(part, 0,  60,  10);
ring = r;
k = 1; count = count + 1; ringLookup(11).index(k) = count; 
for i = inc:inc:1 - inc
    count = count + 1;
    k = k + 1;
    ringLookup(11).index(k) = count; 
    ring = fuseSimplex(ring, rotateSimplex(r, 0, 0, i * pi * 2));
end
model = fuseSimplex(model, ring);

r = translateSimplex(part, 0,  60,  30);
ring = r;
k = 1; count = count + 1; ringLookup(12).index(k) = count; 
for i = inc:inc:1 - inc
    count = count + 1;
    k = k + 1;
    ringLookup(12).index(k) = count; 
    ring = fuseSimplex(ring, rotateSimplex(r, 0, 0, i * pi * 2));
end
model = fuseSimplex(model, ring);

r = translateSimplex(part, 0,  50,  30);
ring = r;
k = 1; count = count + 1; ringLookup(13).index(k) = count; 
for i = inc:inc:1 - inc
    count = count + 1;
    k = k + 1;
    ringLookup(13).index(k) = count; 
    ring = fuseSimplex(ring, rotateSimplex(r, 0, 0, i * pi * 2));
end
model = fuseSimplex(model, ring);

r = translateSimplex(part, 0,  50,  60);
ring = r;
k = 1; count = count + 1; ringLookup(14).index(k) = count; 
for i = inc:inc:1 - inc
    count = count + 1;
    k = k + 1;
    ringLookup(14).index(k) = count; 
    ring = fuseSimplex(ring, rotateSimplex(r, 0, 0, i * pi * 2));
end
model = fuseSimplex(model, ring);

r = translateSimplex(part, 0,  40,  60);
ring = r;
k = 1; count = count + 1; ringLookup(15).index(k) = count; 
for i = inc:inc:1 - inc
    count = count + 1;
    k = k + 1;
    ringLookup(15).index(k) = count; 
    ring = fuseSimplex(ring, rotateSimplex(r, 0, 0, i * pi * 2));
end
model = fuseSimplex(model, ring);

r = translateSimplex(part, 0,  40,  120);
ring = r;
k = 1; count = count + 1; ringLookup(16).index(k) = count; 
for i = inc:inc:1 - inc
    count = count + 1;
    k = k + 1;
    ringLookup(16).index(k) = count; 
    ring = fuseSimplex(ring, rotateSimplex(r, 0, 0, i * pi * 2));
end
model = fuseSimplex(model, ring);

r = translateSimplex(part, 0,  30,  120);
ring = r;
k = 1; count = count + 1; ringLookup(17).index(k) = count; 
for i = inc:inc:1 - inc
    count = count + 1;
    k = k + 1;
    ringLookup(17).index(k) = count; 
    ring = fuseSimplex(ring, rotateSimplex(r, 0, 0, i * pi * 2));
end
model = fuseSimplex(model, ring);

r = translateSimplex(part, 0,  30,  60);
ring = r;
k = 1; count = count + 1; ringLookup(18).index(k) = count;
for i = inc:inc:1 - inc
    count = count + 1;
    k = k + 1;
    ringLookup(18).index(k) = count; 
    ring = fuseSimplex(ring, rotateSimplex(r, 0, 0, i * pi * 2));
end
model = fuseSimplex(model, ring);

for j = 1:8
    for i = 1:1 / inc
        m = mod(i, 1 / inc) + 1;
        n = mod(i + 1, 1 / inc) + 1;

        model = bindNodes(model, ringLookup(j).index(m) - 1, ringLookup(j + 1).index(m) - 1);
        model = createBumper(model, ringLookup(j).index(m) - 1, ringLookup(j + 1).index(m) - 1);

        model = bindNodes(model, ringLookup(j).index(m) - 1, ringLookup(j + 1).index(n) - 1);
        model = createBumper(model, ringLookup(j).index(m) - 1, ringLookup(j + 1).index(n) - 1);    
        
        model = bindNodes(model, ringLookup(j).index(n) - 1, ringLookup(j + 1).index(m) - 1);
    end
    
    for i = 1:1 / inc
        m = mod(i, 1 / inc) + 1;
        n = mod(i + 1, 1 / inc) + 1;
        
        model = createDynCont(model,  ringLookup(j).index(m) - 1,  ringLookup(j).index(n) - 1, ringLookup(j + 1).index(m) - 1); 
        
        model = createDynCont(model,  ringLookup(j + 1).index(m) - 1,  ringLookup(j).index(n) - 1, ringLookup(j + 1).index(n) - 1); 
    end
end

for j = 10:17
    for i = 1:1 / inc
        m = mod(i, 1 / inc) + 1;
        n = mod(i + 1, 1 / inc) + 1;
    
        model = bindNodes(model, ringLookup(j).index(m) - 1, ringLookup(j + 1).index(m) - 1);
        model = createBumper(model, ringLookup(j).index(m) - 1, ringLookup(j + 1).index(m) - 1);

        model = bindNodes(model, ringLookup(j).index(m) - 1, ringLookup(j + 1).index(n) - 1);
        model = createBumper(model, ringLookup(j).index(m) - 1, ringLookup(j + 1).index(n) - 1);    
        
        model = bindNodes(model, ringLookup(j).index(n) - 1, ringLookup(j + 1).index(m) - 1);
    end

    for i = 1:1 / inc
        m = mod(i, 1 / inc) + 1;
        n = mod(i + 1, 1 / inc) + 1;
        
        model = createDynCont(model,  ringLookup(j).index(m) - 1,  ringLookup(j).index(n) - 1, ringLookup(j + 1).index(m) - 1); 
        
        model = createDynCont(model,  ringLookup(j + 1).index(m) - 1,  ringLookup(j).index(n) - 1, ringLookup(j + 1).index(n) - 1); 
    end
end

for i = 1:1 / inc
    m = mod(i, 1 / inc) + 1;
    n = mod(i + 1, 1 / inc) + 1;
    
    model = bindNodes(model, ringLookup(9).index(m) - 1, ringLookup(18).index(m) - 1);
    model = createBumper(model, ringLookup(9).index(m) - 1, ringLookup(18).index(m) - 1);

    model = bindNodes(model, ringLookup(9).index(m) - 1, ringLookup(18).index(n) - 1);
    model = createBumper(model, ringLookup(9).index(m) - 1, ringLookup(18).index(n) - 1);    
    
    model = bindNodes(model, ringLookup(9).index(n) - 1, ringLookup(18).index(m) - 1);
end

for i = 1:1 / inc
    m = mod(i, 1 / inc) + 1;
    n = mod(i + 1, 1 / inc) + 1;
        
    model = createDynCont(model,  ringLookup(9).index(m) - 1,  ringLookup(9).index(n) - 1, ringLookup(18).index(m) - 1); 
        
    model = createDynCont(model,  ringLookup(18).index(m) - 1,  ringLookup(9).index(n) - 1, ringLookup(18).index(n) - 1); 
end

for j = 1:18
    for i = 1:1 / inc
        m = mod(i, 1 / inc) + 1;
        n = mod(i + 1, 1 / inc) + 1;

        model = bindNodes(model, ringLookup(j).index(m) - 1, ringLookup(j).index(n) - 1);
    end
end

for j = 3:9
    for i = 1:1 / inc
        m = mod(i, 1 / inc) + 1;
        n = mod(i + 1, 1 / inc) + 1;
        
        model = createBumper(model, ringLookup(j).index(m) - 1, ringLookup(j).index(n) - 1);    
    end
end

for j = 12:18
    for i = 1:1 / inc
        m = mod(i, 1 / inc) + 1;
        n = mod(i + 1, 1 / inc) + 1;
        
        model = createBumper(model, ringLookup(j).index(m) - 1, ringLookup(j).index(n) - 1);    
    end
end


for i = 1:1 / inc
    model = bindNodes(model, ringLookup(1).index(i) - 1, 0);
    
    model = bindNodes(model, ringLookup(10).index(i) - 1, 1);
end

for i = 1:1 / inc
    m = mod(i, 1 / inc) + 1;
    n = mod(i + 1, 1 / inc) + 1;
    
    model = bindNodes(model, ringLookup(2).index(m) - 1, ringLookup(4).index(m) - 1);
    model = bindNodes(model, ringLookup(2).index(m) - 1, ringLookup(4).index(n) - 1);
    model = bindNodes(model, ringLookup(2).index(n) - 1, ringLookup(4).index(m) - 1);
    
    model = bindNodes(model, ringLookup(6).index(m) - 1, ringLookup(4).index(m) - 1);
    model = bindNodes(model, ringLookup(6).index(m) - 1, ringLookup(4).index(n) - 1);
    model = bindNodes(model, ringLookup(6).index(n) - 1, ringLookup(4).index(m) - 1);
    
    model = bindNodes(model, ringLookup(6).index(m) - 1, ringLookup(8).index(m) - 1);
    model = bindNodes(model, ringLookup(6).index(m) - 1, ringLookup(8).index(n) - 1);
    model = bindNodes(model, ringLookup(6).index(n) - 1, ringLookup(8).index(m) - 1);
    
    model = bindNodes(model, ringLookup(11).index(m) - 1, ringLookup(13).index(m) - 1);
    model = bindNodes(model, ringLookup(11).index(m) - 1, ringLookup(13).index(n) - 1);
    model = bindNodes(model, ringLookup(11).index(n) - 1, ringLookup(13).index(m) - 1);

    model = bindNodes(model, ringLookup(15).index(m) - 1, ringLookup(13).index(m) - 1);
    model = bindNodes(model, ringLookup(15).index(m) - 1, ringLookup(13).index(n) - 1);
    model = bindNodes(model, ringLookup(15).index(n) - 1, ringLookup(13).index(m) - 1);
    
    model = bindNodes(model, ringLookup(15).index(m) - 1, ringLookup(17).index(m) - 1);
    model = bindNodes(model, ringLookup(15).index(m) - 1, ringLookup(17).index(n) - 1);
    model = bindNodes(model, ringLookup(15).index(n) - 1, ringLookup(17).index(m) - 1);
end

for i = 1:1 / inc
    model = bindNodes(model, ringLookup(8).index(i) - 1, ringLookup(17).index(i) - 1);    
    model = createBumper(model, ringLookup(8).index(i) - 1, ringLookup(17).index(i) - 1);    
end

for i = 1:1 / inc
    m = mod(i, 1 / inc) + 1;
    n = mod(i + 1, 1 / inc) + 1;
    model = bindNodes(model, ringLookup(9).index(m) - 1, ringLookup(17).index(n) - 1);    
    model = bindNodes(model, ringLookup(8).index(n) - 1, ringLookup(18).index(m) - 1);
    model = createBumper(model, ringLookup(8).index(n) - 1, ringLookup(18).index(m) - 1);    
    
    model = createDynCont(model,  ringLookup(8).index(n) - 1,  ringLookup(17).index(n) - 1, ringLookup(18).index(m) - 1); 
        
    model = createDynCont(model,  ringLookup(9).index(m) - 1,  ringLookup(18).index(m) - 1, ringLookup(8).index(n) - 1); 
end

figure('Color', [0 0 0], 'Position', [200 50 800 600]);
axes('Color', [0 0 0]);
axis([-200 200 -200 200 -200 200]);
camproj('perspective');
saveSimplex('model.simplex', model);
render model.simplex

model