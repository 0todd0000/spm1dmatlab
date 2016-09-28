

clear;  clc


%(0) Create data:
yA        = [5.7, 8.4, 6.0, 6.4, 5.5]';
yB        = [5.3, 8.2, 5.5, 6.1, 5.6]';



%(1) Conduct non-parametric test:
rng(0)
alpha      = 0.05;
two_tailed = true;
snpm       = spm1d.stats.nonparam.ttest_paired(yA, yB);
snpmi      = snpm.inference(alpha, 'two_tailed', two_tailed);
disp('Non-parametric results')
disp( snpmi )



%(2) Compare to parametric inference:
spm        = spm1d.stats.ttest_paired(yA, yB);
spmi       = spm.inference(alpha, 'two_tailed',two_tailed);
disp('Parametric results')
disp( spmi )













