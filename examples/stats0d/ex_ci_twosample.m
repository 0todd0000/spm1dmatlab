

clear classes;  clc


%(0) Load dataset:
dataset   = spm1d.data.uv0d.ci2.AnimalsInResearch();
[yA,yB]   = deal( dataset.YA, dataset.YB );
fprintf('Expected results:\n')
fprintf('    alpha = %s\n', dataset.alpha)
fprintf('    ci = (%.5f, %.5f)\n', dataset.ci)

% 
% %(1) Compute confidence interval:
% alpha = 0.05;
% mu    = 0;
% ci    = spm1d.stats.ci_onesample(y, alpha, 'mu',mu);
% disp(ci)
















