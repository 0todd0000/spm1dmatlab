

clear;  clc


%(0) Load dataset:
dataset = spm1d.data.uv1d.t1.Random();
% dataset = spm1d.data.uv1d.t1.SimulatedPataky2015a();
% dataset = spm1d.data.uv1d.t1.SimulatedPataky2015b();
y       = dataset.Y;
mu      = 0;    %null criterion



%(1) Compute confidence intervals:
alpha = 0.05;
ci    = spm1d.stats.ci_onesample(y, alpha, mu);
cinp  = spm1d.stats.nonparam.ci_onesample(y, alpha, mu, 'iterations',-1);
disp(ci)
disp(cinp)


%(2) Plot:
figure('position',[0 0 900 300])
subplot(121);  ci.plot();  xlim([0 100])
subplot(122);  cinp.plot();  xlim([0 100])












