simplex = fuseSimplex(rotor, plane);
%simplex = plane;
saveSimplex('simplex.dat', simplex);

c = 1;
for i = 1:900
    tic
    if i < 200
        temp = loadSimplex('simplex.dat');
        
        for j = 1:5
            temp = fuseSimplex(temp, translateSimplex(emit, -90 + rand * 40, -20 + rand * 40, 200 - rand * 40));
        end
            
        saveSimplex('simplex.dat', temp);
    end
    tA = toc;
    
    tic
    cla;
    disp 'rendering:'
    render('simplex.dat');
    im     = getframe(gcf);
    aviobj = addframe(aviobj, im);
    tB = toc;
    
    tic;
    !fisx simplex.dat
    tC = toc;
    
    fprintf('%i:1800 %f %f %f \n', i, tA, tB, tC);       
end