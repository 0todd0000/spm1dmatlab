

clear ;  clc


%(0) Load dataset:
% dataset   = spm1d.data.uv1d.t2.PlantarArchAngle();
dataset   = spm1d.data.uv1d.t2.SimulatedTwoLocalMax();
[yA,yB]   = deal( dataset.YA, dataset.YB );



%(1) Compute confidence intervals:
alpha = 0.05;
ci    = spm1d.stats.ci_twosample(yA, yB, alpha, 'meanA', 'meanB');
cinp  = spm1d.stats.nonparam.ci_twosample(yA, yB, alpha, 'meanA', 'meanB', 'iterations', -1);
disp(ci)
disp(cinp)


%(2) Plot:
figure('position',[0 0 900 300])
subplot(121);  ci.plot();  xlim([0 100])
subplot(122);  cinp.plot();  xlim([0 100])