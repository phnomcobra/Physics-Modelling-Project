function Pegasus

part = loadSimplex('node.simplex');

model =                    translateSimplex(part, -5,  20,   -5);
model = fuseSimplex(model, translateSimplex(part,  5,  20,   -5));
model = fuseSimplex(model, translateSimplex(part, -5,  10,   -5));
model = fuseSimplex(model, translateSimplex(part,  5,  10,   -5));
model = fuseSimplex(model, translateSimplex(part, -5,   0,   -5));
model = fuseSimplex(model, translateSimplex(part,  5,   0,   -5));
model = fuseSimplex(model, translateSimplex(part, -5, -10,   -5));
model = fuseSimplex(model, translateSimplex(part,  5, -10,   -5));
model = fuseSimplex(model, translateSimplex(part, -5, -20,   -5));
model = fuseSimplex(model, translateSimplex(part,  5, -20,   -5));
model = fuseSimplex(model, translateSimplex(part,  0,  20,    0));
model = fuseSimplex(model, translateSimplex(part,  0,  10,    0));
model = fuseSimplex(model, translateSimplex(part,  0,   0,    0));
model = fuseSimplex(model, translateSimplex(part,  0, -10,    0));
model = fuseSimplex(model, translateSimplex(part,  0, -20,    0));


model = bindNodes(model, 0, 1);
model = bindNodes(model, 2, 1);
model = bindNodes(model, 0, 2);
model = bindNodes(model, 3, 1);
model = bindNodes(model, 3, 2);
model = bindNodes(model, 3, 5);
model = bindNodes(model, 2, 4);
model = bindNodes(model, 5, 2);
model = bindNodes(model, 4, 5);
model = bindNodes(model, 4, 6);
model = bindNodes(model, 7, 5);
model = bindNodes(model, 6, 5);
model = bindNodes(model, 6, 7);
model = bindNodes(model, 9, 7);
model = bindNodes(model, 6, 8);
model = bindNodes(model, 6, 9);
model = bindNodes(model, 8, 9);

model = bindNodes(model, 0, 10);
model = bindNodes(model, 1, 10);
model = bindNodes(model, 2, 11);
model = bindNodes(model, 3, 11);
model = bindNodes(model, 4, 12);
model = bindNodes(model, 5, 12);
model = bindNodes(model, 6, 13);
model = bindNodes(model, 7, 13);
model = bindNodes(model, 8, 14);
model = bindNodes(model, 9, 14);

model = bindNodes(model, 10, 11);
model = bindNodes(model, 11, 12);
model = bindNodes(model, 12, 13);
model = bindNodes(model, 13, 14);

model = bindNodes(model, 10,  2);
model = bindNodes(model,  2, 12);
model = bindNodes(model, 12,  6);
model = bindNodes(model,  6, 14);

model = bindNodes(model, 11,  1);
model = bindNodes(model, 11,  5);
model = bindNodes(model, 13,  5);
model = bindNodes(model, 13,  9);

model = bindNodes(model, 0,  3);
model = bindNodes(model, 4,  3);
model = bindNodes(model, 4,  7);
model = bindNodes(model, 8,  7);

model = bindNodes(model, 0, 11);
model = bindNodes(model, 4, 11);
model = bindNodes(model, 4, 13);
model = bindNodes(model, 8, 13);

model = bindNodes(model, 10,  3);
model = bindNodes(model, 12,  3);
model = bindNodes(model, 12,  7);
model = bindNodes(model, 14,  7);

model = fuseSimplex(model, translateSimplex(part, -2.5, 25,   -5));
model = fuseSimplex(model, translateSimplex(part,  2.5, 25,   -5));
model = fuseSimplex(model, translateSimplex(part, -2.5, 25, -2.5));
model = fuseSimplex(model, translateSimplex(part,  2.5, 25, -2.5));

model = bindNodes(model, 15, 16);
model = bindNodes(model, 16, 18);
model = bindNodes(model, 17, 18);
model = bindNodes(model, 15, 17);

model = bindNodes(model, 0, 15);
model = bindNodes(model, 0, 16);
model = bindNodes(model, 0, 17);
model = bindNodes(model, 0, 18);

model = bindNodes(model, 1, 15);
model = bindNodes(model, 1, 16);
model = bindNodes(model, 1, 17);
model = bindNodes(model, 1, 18);

model = bindNodes(model, 10, 15);
model = bindNodes(model, 10, 16);
model = bindNodes(model, 10, 17);
model = bindNodes(model, 10, 18);

model = fuseSimplex(model, translateSimplex(part,  5, 20, -2.5));
model = fuseSimplex(model, translateSimplex(part, -5, 20, -2.5));

model = bindNodes(model,  0, 20);
model = bindNodes(model,  1, 19);
model = bindNodes(model, 10, 20);
model = bindNodes(model, 10, 19);
model = bindNodes(model, 17, 20);
model = bindNodes(model, 18, 19);

model = fuseSimplex(model, translateSimplex(part, -7.5,  10,   -5));
model = fuseSimplex(model, translateSimplex(part, -7.5,  10, -2.5));
model = fuseSimplex(model, translateSimplex(part,  7.5,  10,   -5));
model = fuseSimplex(model, translateSimplex(part,  7.5,  10, -2.5));
model = fuseSimplex(model, translateSimplex(part, -7.5,   0,   -5));
model = fuseSimplex(model, translateSimplex(part, -7.5,   0, -2.5));
model = fuseSimplex(model, translateSimplex(part,  7.5,   0,   -5));
model = fuseSimplex(model, translateSimplex(part,  7.5,   0, -2.5));
model = fuseSimplex(model, translateSimplex(part, -7.5, -10,   -5));
model = fuseSimplex(model, translateSimplex(part, -7.5, -10, -2.5));
model = fuseSimplex(model, translateSimplex(part,  7.5, -10,   -5));
model = fuseSimplex(model, translateSimplex(part,  7.5, -10, -2.5));
model = fuseSimplex(model, translateSimplex(part, -7.5, -20,   -5));
model = fuseSimplex(model, translateSimplex(part, -7.5, -20, -2.5));
model = fuseSimplex(model, translateSimplex(part,  7.5, -20,   -5));
model = fuseSimplex(model, translateSimplex(part,  7.5, -20, -2.5));

model = bindNodes(model, 21,  2);
model = bindNodes(model, 22,  2);
model = bindNodes(model, 21, 11);
model = bindNodes(model, 22, 11);

model = bindNodes(model, 25,  4);
model = bindNodes(model, 26,  4);
model = bindNodes(model, 25, 12);
model = bindNodes(model, 26, 12);

model = bindNodes(model, 29,  6);
model = bindNodes(model, 30,  6);
model = bindNodes(model, 29, 13);
model = bindNodes(model, 30, 13);

model = bindNodes(model, 33,  8);
model = bindNodes(model, 34,  8);
model = bindNodes(model, 33, 14);
model = bindNodes(model, 34, 14);

model = bindNodes(model, 0,  21);
model = bindNodes(model, 20, 22);
model = bindNodes(model, 25, 21);
model = bindNodes(model, 26, 22);
model = bindNodes(model, 25, 29);
model = bindNodes(model, 26, 30);
model = bindNodes(model, 29, 33);
model = bindNodes(model, 30, 34);

model = bindNodes(model, 22,  0);
model = bindNodes(model, 21, 20);
model = bindNodes(model, 21, 26);
model = bindNodes(model, 22, 25);
model = bindNodes(model, 30, 25);
model = bindNodes(model, 29, 26);
model = bindNodes(model, 29, 34);
model = bindNodes(model, 30, 33);
model = bindNodes(model, 21, 22);
model = bindNodes(model, 25, 26);
model = bindNodes(model, 29, 30);
model = bindNodes(model, 33, 34);
model = bindNodes(model, 21,  4);
model = bindNodes(model, 25,  2);
model = bindNodes(model, 29,  4);
model = bindNodes(model, 33,  6);
model = bindNodes(model, 25,  6);
model = bindNodes(model, 29,  8);

model = bindNodes(model, 20, 11);
model = bindNodes(model, 22, 10);

model = bindNodes(model, 26, 11);
model = bindNodes(model, 22, 12);

model = bindNodes(model, 26, 13);
model = bindNodes(model, 30, 12);

model = bindNodes(model, 30, 14);
model = bindNodes(model, 34, 13);

model = bindNodes(model, 11, 24);
model = bindNodes(model, 11, 23);
model = bindNodes(model,  3, 24);
model = bindNodes(model,  3, 23);

model = bindNodes(model, 12, 28);
model = bindNodes(model, 12, 27);
model = bindNodes(model,  5, 28);
model = bindNodes(model,  5, 27);

model = bindNodes(model, 13, 32);
model = bindNodes(model, 13, 31);
model = bindNodes(model,  7, 32);
model = bindNodes(model,  7, 31);

model = bindNodes(model, 14, 36);
model = bindNodes(model, 14, 35);
model = bindNodes(model,  9, 36);
model = bindNodes(model,  9, 35);

model = bindNodes(model, 23, 24);
model = bindNodes(model, 27, 28);
model = bindNodes(model, 31, 32);
model = bindNodes(model, 35, 36);

model = bindNodes(model, 19, 24);
model = bindNodes(model, 28, 24);
model = bindNodes(model, 28, 32);
model = bindNodes(model, 36, 32);

model = bindNodes(model,  1, 23);
model = bindNodes(model, 27, 23);
model = bindNodes(model, 27, 31);
model = bindNodes(model, 35, 31);

model = bindNodes(model,  5, 23);
model = bindNodes(model,  3, 27);
model = bindNodes(model,  5, 31);
model = bindNodes(model,  7, 27);
model = bindNodes(model,  9, 31);
model = bindNodes(model,  7, 35);

model = bindNodes(model, 19, 23);
model = bindNodes(model,  1, 24);
model = bindNodes(model, 24, 27);
model = bindNodes(model, 28, 23);
model = bindNodes(model, 31, 28);
model = bindNodes(model, 32, 27);
model = bindNodes(model, 35, 32);
model = bindNodes(model, 36, 31);

model = bindNodes(model, 19, 11);
model = bindNodes(model, 10, 24);
model = bindNodes(model, 12, 24);
model = bindNodes(model, 11, 28);
model = bindNodes(model, 12, 32);
model = bindNodes(model, 13, 28);
model = bindNodes(model, 14, 32);
model = bindNodes(model, 13, 36);

model = fuseSimplex(model, translateSimplex(part,  5, -30, -2.5));
model = fuseSimplex(model, translateSimplex(part, -5, -30, -2.5));

model = bindNodes(model, 37, 34);
model = bindNodes(model, 37, 33);
model = bindNodes(model, 37, 36);
model = bindNodes(model, 37, 35);
model = bindNodes(model, 37,  8);
model = bindNodes(model, 37,  9);
model = bindNodes(model, 37, 14);

model = bindNodes(model, 38, 34);
model = bindNodes(model, 38, 33);
model = bindNodes(model, 38, 36);
model = bindNodes(model, 38, 35);
model = bindNodes(model, 38,  8);
model = bindNodes(model, 38,  9);
model = bindNodes(model, 38, 14);

model = bindNodes(model, 38, 37);

model = fuseSimplex(model, translateSimplex(part, -20, -15, -2.5));
model = fuseSimplex(model, translateSimplex(part, -20, -20, -2.5));
model = fuseSimplex(model, translateSimplex(part,  20, -15, -2.5));
model = fuseSimplex(model, translateSimplex(part,  20, -20, -2.5));

model = bindNodes(model, 39, 40);

model = bindNodes(model, 39, 30);
model = bindNodes(model, 39, 29);
model = bindNodes(model, 39,  6);
model = bindNodes(model, 39,  8);
model = bindNodes(model, 39, 34);
model = bindNodes(model, 39, 33);

model = bindNodes(model, 40, 30);
model = bindNodes(model, 40, 29);
model = bindNodes(model, 40,  6);
model = bindNodes(model, 40,  8);
model = bindNodes(model, 40, 34);
model = bindNodes(model, 40, 33);

model = bindNodes(model, 41, 42);

model = bindNodes(model, 41, 32);
model = bindNodes(model, 41, 31);
model = bindNodes(model, 41,  7);
model = bindNodes(model, 41, 36);
model = bindNodes(model, 41, 35);
model = bindNodes(model, 41,  9);

model = bindNodes(model, 42, 32);
model = bindNodes(model, 42, 31);
model = bindNodes(model, 42,  7);
model = bindNodes(model, 42, 36);
model = bindNodes(model, 42, 35);
model = bindNodes(model, 42,  9);

model = bindNodes(model, 39, 41);
model = bindNodes(model, 42, 40);
model = bindNodes(model, 39, 42);
model = bindNodes(model, 40, 41);

model = createBumper(model, 15, 16);
model = createBumper(model, 18, 16);
model = createBumper(model, 17, 18);
model = createBumper(model, 15, 17);
model = createBumper(model, 15, 18);
model = createBumper(model, 20, 17);
model = createBumper(model, 18, 19);
model = createBumper(model,  0, 15);
model = createBumper(model,  1, 16);
model = createBumper(model, 20,  0);
model = createBumper(model, 19,  1);
model = createBumper(model, 15, 20);
model = createBumper(model, 16, 19);
model = createBumper(model, 10, 20);
model = createBumper(model, 10, 17);
model = createBumper(model, 10, 18);
model = createBumper(model, 10, 19);
model = createBumper(model,  0,  1);
model = createBumper(model,  0, 16);
model = createBumper(model, 20, 22);
model = createBumper(model, 10, 22);
model = createBumper(model, 11, 22);
model = createBumper(model, 11, 10);
model = createBumper(model, 11, 12);
model = createBumper(model, 12, 13);
model = createBumper(model, 13, 14);
model = createBumper(model, 22, 26);
model = createBumper(model, 26, 30);
model = createBumper(model, 30, 34);
model = createBumper(model, 12, 26);
model = createBumper(model, 13, 30);
model = createBumper(model, 14, 34);
model = createBumper(model, 22, 12);
model = createBumper(model, 26, 13);
model = createBumper(model, 30, 14);
model = createBumper(model, 10, 24);
model = createBumper(model, 19, 24);
model = createBumper(model, 28, 24);
model = createBumper(model, 32, 28);
model = createBumper(model, 36, 32);
model = createBumper(model, 11, 28);
model = createBumper(model, 12, 32);
model = createBumper(model, 13, 36);
model = createBumper(model, 11, 24);
model = createBumper(model, 12, 28);
model = createBumper(model, 13, 32);
model = createBumper(model, 14, 36);
model = createBumper(model, 22, 21);
model = createBumper(model,  2, 21);
model = createBumper(model,  3,  2);
model = createBumper(model,  3, 23);
model = createBumper(model, 23, 24);
model = createBumper(model, 26, 25);
model = createBumper(model,  4, 25);
model = createBumper(model,  5,  4);
model = createBumper(model,  5, 27);
model = createBumper(model, 27, 28);
model = createBumper(model, 30, 29);
model = createBumper(model,  6, 29);
model = createBumper(model,  7,  6);
model = createBumper(model,  7, 31);
model = createBumper(model, 31, 32);
model = createBumper(model, 34, 33);
model = createBumper(model,  8, 33);
model = createBumper(model,  9,  8);
model = createBumper(model,  9, 35);
model = createBumper(model, 35, 36);
model = createBumper(model,  0,  2);
model = createBumper(model,  2,  4);
model = createBumper(model,  4,  6);
model = createBumper(model,  6,  8);
model = createBumper(model,  8, 38);
model = createBumper(model,  1,  3);
model = createBumper(model,  3,  5);
model = createBumper(model,  5,  7);
model = createBumper(model,  7,  9);
model = createBumper(model,  9, 37);
model = createBumper(model,  0, 21);
model = createBumper(model, 25, 21);
model = createBumper(model, 25, 29);
model = createBumper(model, 33, 29);
model = createBumper(model, 33, 38);
model = createBumper(model,  1, 23);
model = createBumper(model, 27, 23);
model = createBumper(model, 27, 31);
model = createBumper(model, 35, 31);
model = createBumper(model, 35, 37);
model = createBumper(model,  1,  2);
model = createBumper(model,  3,  4);
model = createBumper(model,  5,  6);
model = createBumper(model,  7,  8);
model = createBumper(model, 20, 21);
model = createBumper(model, 19, 23);
model = createBumper(model, 21, 26);
model = createBumper(model, 25, 30);
model = createBumper(model,  2, 25);
model = createBumper(model,  4, 29);
model = createBumper(model,  6, 33);
model = createBumper(model, 22, 23);
model = createBumper(model, 21, 25);
model = createBumper(model, 23, 28);
model = createBumper(model, 27, 32);
model = createBumper(model,  3, 27);
model = createBumper(model,  5, 31);
model = createBumper(model,  7, 35);
model = createBumper(model, 30, 39);
model = createBumper(model, 29, 39);
model = createBumper(model, 34, 40);
model = createBumper(model, 33, 40);
model = createBumper(model, 39, 40);
model = createBumper(model, 39, 33);
model = createBumper(model, 39, 34);
model = createBumper(model, 32, 41);
model = createBumper(model, 31, 41);
model = createBumper(model, 36, 42);
model = createBumper(model, 35, 42);
model = createBumper(model, 41, 42);
model = createBumper(model, 41, 35);
model = createBumper(model, 41, 36);
model = createBumper(model, 38, 37);
model = createBumper(model, 38, 14);
model = createBumper(model, 14, 37);
model = createBumper(model, 38, 34);
model = createBumper(model, 36, 37);
model = createBumper(model,  8, 37);





















model = createDynCont(model, 20, 15, 17);
model = createDynCont(model, 19, 18, 16);
model = createDynCont(model, 20, 15,  0);
model = createDynCont(model, 19,  1, 16);
model = createDynCont(model, 15, 18, 16);
model = createDynCont(model, 15, 18, 17);
model = createDynCont(model, 17, 10, 20);
model = createDynCont(model, 17, 10, 18);
model = createDynCont(model, 10, 18, 19);
model = createDynCont(model,  0, 15, 16);
model = createDynCont(model,  0,  1, 16);
model = createDynCont(model, 10, 22, 20);
model = createDynCont(model, 10, 11, 22);

model = createDynCont(model, 22, 26, 12);
model = createDynCont(model, 22, 11, 12);

model = createDynCont(model, 26, 30, 13);
model = createDynCont(model, 26, 12, 13);

model = createDynCont(model, 30, 34, 14);
model = createDynCont(model, 30, 13, 14);

model = createDynCont(model, 19, 24, 10);
model = createDynCont(model, 24, 11, 10);

model = createDynCont(model, 11, 12, 28);
model = createDynCont(model, 11, 24, 28);

model = createDynCont(model, 12, 13, 32);
model = createDynCont(model, 12, 28, 32);

model = createDynCont(model, 13, 14, 36);
model = createDynCont(model, 13, 32, 36);


model = createDynCont(model, 20, 21, 22);
model = createDynCont(model,  0, 21, 20);

model = createDynCont(model, 19, 23, 24);
model = createDynCont(model,  1, 23, 19);

model = createDynCont(model, 21, 25, 26);
model = createDynCont(model, 22, 21, 26);
model = createDynCont(model, 23, 27, 28);
model = createDynCont(model, 24, 23, 28);

model = createDynCont(model, 25, 29, 30);
model = createDynCont(model, 26, 25, 30);
model = createDynCont(model, 27, 31, 32);
model = createDynCont(model, 28, 27, 32);

model = createDynCont(model, 21,  0,  2);

model = createDynCont(model, 23,  1,  3);

model = createDynCont(model, 21,  2, 25);
model = createDynCont(model,  4,  2, 25);
model = createDynCont(model, 23,  3, 27);
model = createDynCont(model,  5,  3, 27);

model = createDynCont(model, 25,  4, 29);
model = createDynCont(model,  6,  4, 29);
model = createDynCont(model, 27,  5, 31);
model = createDynCont(model,  7,  5, 31);

model = createDynCont(model, 29,  6, 33);
model = createDynCont(model,  8,  6, 33);
model = createDynCont(model, 31,  7, 35);
model = createDynCont(model,  9,  7, 35);

model = createDynCont(model,  0,  1,  2);
model = createDynCont(model,  3,  1,  2);

model = createDynCont(model,  2,  3,  4);
model = createDynCont(model,  5,  3,  4);

model = createDynCont(model,  4,  5,  6);
model = createDynCont(model,  7,  5,  6);

model = createDynCont(model,  6,  7,  8);
model = createDynCont(model,  9,  7,  8);

model = createDynCont(model, 30, 29, 39);
model = createDynCont(model, 39, 34, 30);
model = createDynCont(model, 39, 40, 34);
model = createDynCont(model, 39, 33, 29);
model = createDynCont(model, 39, 40, 33);
model = createDynCont(model, 40, 34, 33);

model = createDynCont(model, 32, 31, 41);
model = createDynCont(model, 41, 36, 32);
model = createDynCont(model, 41, 42, 36);
model = createDynCont(model, 41, 35, 31);
model = createDynCont(model, 41, 42, 35);
model = createDynCont(model, 42, 36, 35);

model = createDynCont(model, 33,  8, 38);
model = createDynCont(model, 33, 34, 38);
model = createDynCont(model, 34, 14, 38);
model = createDynCont(model, 14, 37, 38);
model = createDynCont(model, 14, 36, 37);
model = createDynCont(model, 35, 36, 37);
model = createDynCont(model,  9, 35, 37);
model = createDynCont(model,  8,  9, 37);
model = createDynCont(model, 37, 38,  8);

model

figure('Color', [0 0 0], 'Position', [200 50 800 600]);
axes('Color', [0 0 0]);
axis([-50 50 -50 50 -50 50]);
camproj('perspective');
saveSimplex('model.simplex', model);
render model.simplex