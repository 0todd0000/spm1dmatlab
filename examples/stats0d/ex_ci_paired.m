
%{
Optional keyword input arguments to spm1d.stats.ci_pairedsample:
    datum, mu  

datum : 'difference' or 'meanA'

If datum is 'difference', mu must be numerical (default: mu=0)

If datum is 'meanA', mu must be either 'meanB' (default) or 'tailB'
%}

clear classes;  clc


%(0) Load dataset:
dataset   = spm1d.data.uv0d.cipaired.FraminghamSystolicBloodPressure();
[yA,yB]   = deal( dataset.YA, dataset.YB );
fprintf('Expected results:\n')
fprintf('    alpha = %s\n', dataset.alpha)
fprintf('    ci = (%.5f, %.5f)\n', dataset.ci)

 
%(1) Compute three difference confidence intervals
alpha = 0.05;
ci1   = spm1d.stats.ci_pairedsample(yA, yB, alpha, 'difference', 2);
% % ci2   = spm1d.stats.ci_pairedsample(yA, yB, alpha, 'datum','meanA', 'mu','meanB');
% ci2   = spm1d.stats.ci_pairedsample(yA, yB, alpha, 'datum','meanA');
% ci3   = spm1d.stats.ci_pairedsample(yA, yB, alpha, 'datum','meanA', 'mu','tailB');
disp(ci1)
% disp(ci2)
% disp(ci3)
















