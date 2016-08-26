

clear ;  clc


%(0) Load dataset:
dataset   = spm1d.data.uv0d.ci2.AnimalsInResearch();
[yA,yB]   = deal( dataset.YA, dataset.YB );
fprintf('Expected results:\n')
fprintf('    alpha = %s\n', dataset.alpha)
fprintf('    ci = (%.5f, %.5f)\n', dataset.ci)


%(1) Compute three confidence intervals
%{
The three CIs below are equivalent, but they may seem different because
each has a different datum-criterion combination.

>>  spm1d.stats.ci_twosample(yA, yB, alpha, datum, criterion)

"datum" and "criterion" are optional;
defaults are 'difference' and 0, respectively
    
"datum" must be either 'difference' or 'meanA'

If "datum" is 'difference', "criterion" must be numerical

If "datum" is 'meanA', "criterion" must be either:
    'meanB' (default) or 'tailB'
%}
alpha = 0.05;
ci1   = spm1d.stats.ci_twosample(yA, yB, alpha, 'difference', 0);
ci2   = spm1d.stats.ci_twosample(yA, yB, alpha, 'meanA', 'meanB');
ci3   = spm1d.stats.ci_twosample(yA, yB, alpha, 'meanA', 'tailB');
disp(ci1)
disp(ci2)
disp(ci3)
%plot
close all
subplot(221);  ci1.plot();  title('datum = "difference", criterion = 0')
subplot(223);  ci2.plot();  title('datum = "meanA", criterion = "meanB"')
subplot(224);  ci3.plot();  title('datum = "meanA", criterion = "tailB"')















