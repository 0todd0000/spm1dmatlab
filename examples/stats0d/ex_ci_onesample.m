

clear;  clc


%(0) Load dataset:
% dataset   = spm1d.data.uv0d.ci1.MinnesotaGeyerRate();
dataset   = spm1d.data.uv0d.ci1.WebsterSleep();
y         = dataset.Y;
fprintf('Expected results:\n')
fprintf('    alpha = %s\n', dataset.alpha)
fprintf('    ci = (%.5f, %.5f)\n', dataset.ci)


%(1) Compute confidence interval:
alpha = 0.05;
mu    = 9;
ci    = spm1d.stats.ci_onesample(y, alpha, 'mu',mu);
disp(ci)
%plot
close all
ci.plot()














