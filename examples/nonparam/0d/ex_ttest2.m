

clear;  clc


%(0) Create dataset:
%%% Dataset 1  (non-normally distributed)
yA         = [5.7, 8.4, 6.0, 6.4, 5.5]';
yB         = [5.3, 8.2, 5.5, 6.1, 5.6]';
%%% Dataset2 (normally distributed)
yA         = [ 1.764,  0.400,  0.978,  2.240,  1.867, -0.977];
yB         = [ 0.950, -0.151, -0.103,  0.410,  0.144,  1.454];



%(1) Conduct non-parametric test:
rng(0)
alpha      = 0.05;
two_tailed = true;
snpm       = spm1d.stats.nonparam.ttest2(yA, yB);
snpmi      = snpm.inference(alpha, 'two_tailed', two_tailed, 'iterations',-1);
disp('Non-parametric results')
disp( snpmi )



%(2) Compare to parametric inference:
spm        = spm1d.stats.ttest2(yA, yB);
spmi       = spm.inference(alpha, 'two_tailed',two_tailed);
disp('Parametric results')
disp( spmi )

