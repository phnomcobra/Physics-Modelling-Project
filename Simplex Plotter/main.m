objectProto;

figure('Color', [0 0 0], 'Position', [100 100 800 600]);
axes('Color', [0 0 0]);
axis([-200 200 -200 200 -200 200]);
camproj('perspective');

aviobj = avifile(['animation.avi'], 'fps', 30, 'quality', 100, 'keyframe', 30, 'compression', 'Cinepak');
commandScript;
aviobj = close(aviobj);