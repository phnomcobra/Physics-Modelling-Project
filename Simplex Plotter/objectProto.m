plane = loadSimplex('plane.simplex');
plane = rbmSimplex(plane, 1);
plane = typeSimplex(plane, 2);
plane = attSimplex(plane, 0);
plane = staticSimplex(plane, 1);

rotor = loadSimplex('model.simplex');
rotor = normalSimplex(rotor, 0, 0, 0);
rotor = rbmSimplex(rotor, 1);
rotor = typeSimplex(rotor, 1);
rotor = springSimplex(rotor, 100, 10, -1);
rotor = attSimplex(rotor, 0);
rotor = drgSimplex(rotor, .0001);

emit = loadSimplex('node.simplex');
emit = rbmSimplex(emit, 1);
emit = typeSimplex(emit, 3);
emit = normalSimplex(emit, 0, 0, -.02);
emit = colorSimplex(emit, 1, 0, 0);
emit.node(1).rad = 12;
emit.node(1).attCoef = .00001;
emit.node(1).fdfCoef = .0001;
emit.node(1).drgCoef = .001;
