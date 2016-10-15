function Plane

part = loadSimplex('node.simplex');

model =                    translateSimplex(part, 200,  200, -200);
model = fuseSimplex(model, translateSimplex(part, -200, 200, -200));
model = fuseSimplex(model, translateSimplex(part, 200,  -200, -200));
model = fuseSimplex(model, translateSimplex(part, -200, -200, -200));

model = createDynCont(model,  0, 1, 2); 
model = createDynCont(model,  1, 2, 3);

figure('Color', [0 0 0], 'Position', [200 50 800 600]);
axes('Color', [0 0 0]);
axis([-200 200 -200 200 -200 200]);
camproj('perspective');
saveSimplex('plane.simplex', model);
render plane.simplex

model