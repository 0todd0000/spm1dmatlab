
clear;  clc


%(0) Create data:
y     = [0.4, 0.2, 0.5, 0.3, -0.1]';
mu    = 0;


%(1) Conduct non-parametric test:
rng(0)
alpha      = 0.05;
two_tailed = false;
snpm       = spm1d.stats.nonparam.ttest(y, mu);
snpmi      = snpm.inference(alpha, 'two_tailed', two_tailed, 'iterations', -1);
disp('Non-parametric results')
disp( snpmi )


%(2) Compare to parametric inference:
spm        = spm1d.stats.ttest(y, mu);
spmi       = spm.inference(alpha, 'two_tailed',two_tailed);
disp('Parametric results')
disp( spmi )














