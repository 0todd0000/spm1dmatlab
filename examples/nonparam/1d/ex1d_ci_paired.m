

clear;  clc


%(0) Load dataset:
dataset   = spm1d.data.uv1d.tpaired.PlantarArchAngle();
[yA,yB]   = deal( dataset.YA, dataset.YB );


 
%(1) Compute confidence intervals:
rng(0)    %seed the random number generator
alpha      = 0.05;
iterations = -1;
ci         = spm1d.stats.ci_pairedsample(yA, yB, alpha, 'meanA', 'meanB');
cinp       = spm1d.stats.nonparam.ci_pairedsample(yA, yB, alpha, 'meanA', 'meanB', 'iterations',iterations);
disp(ci)
disp(cinp)




%(2) Plot:
close all
figure('position',[0 0 900 300])
subplot(121);  ci.plot()
subplot(122);  cinp.plot()










