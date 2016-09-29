

clear;  clc


%(0) Create data:
%'http://www.real-statistics.com/regression/hypothesis-testing-significance-regression-line-slope/'
x    = [5, 23, 25, 48, 17, 8, 4, 26, 11, 19, 14, 35, 29, 4, 23]';
y    = [80, 78, 60, 53, 85, 84, 73, 79, 81, 75, 68, 72, 58, 92, 65]';



%(1) Conduct non-parametric test:
rng(0)
alpha      = 0.05;
two_tailed = true;
snpm       = spm1d.stats.nonparam.regress(y, x);
snpmi      = snpm.inference(alpha, 'two_tailed', two_tailed, 'iterations',5000);
disp(snpmi)



%(2) Compare to parametric inference:
spm        = spm1d.stats.regress(y, x);
spmi       = spm.inference(alpha, 'two_tailed',two_tailed);
disp('Parametric results')
disp( spmi )













