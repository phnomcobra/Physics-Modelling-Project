function data = isoTet

nodeMaster = loadSimplex('node.simplex');

data =                   translateSimplex(nodeMaster, 0, 0, 10);
data = fuseSimplex(data, translateSimplex(nodeMaster, 0, 0, 0));
data = fuseSimplex(data, translateSimplex(nodeMaster, 10, 0, 0));
data = fuseSimplex(data, translateSimplex(nodeMaster, 0, 10, 0));

data = bindNodes(data, 0, 1);
data = bindNodes(data, 0, 2);
data = bindNodes(data, 0, 3);
data = bindNodes(data, 1, 2);
data = bindNodes(data, 1, 3);
data = bindNodes(data, 3, 2);

data = createBumper(data, 0, 1, [0 1 2 3 4 5]);
data = createBumper(data, 0, 2, [0 1 2 3 4 5]);
data = createBumper(data, 0, 3, [0 1 2 3 4 5]);
data = createBumper(data, 1, 2, [0 1 2 3 4 5]);
data = createBumper(data, 1, 3, [0 1 2 3 4 5]);
data = createBumper(data, 3, 2, [0 1 2 3 4 5]);

data = createDynCont(data, 0, 1, 2);
data = createDynCont(data, 0, 1, 3);
data = createDynCont(data, 0, 2, 3);
data = createDynCont(data, 3, 1, 2);