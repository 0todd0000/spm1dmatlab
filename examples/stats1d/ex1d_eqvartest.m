    

clear;  clc



%(0) Load dataset:
dataset = spm1d.data.uv1d.t2.PlantarArchAngle();
% dataset = spm1d.data.uv1d.t2.SimulatedTwoLocalMax();
[y0,y1] = deal(dataset.YA, dataset.YB);


[f,fcrit] = spm1d.stats.eqvartest(y0,y1, 'alt', 'unequal', 'alpha', 0.05);



close all
plot(f)
yline(fcrit, 'r--')
ylabel('SPM\{F\}')














