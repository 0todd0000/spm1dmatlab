

clear;  clc




%(0) Load dataset:
dataset    = spm1d.data.mv0d.manova1.AnimalDepression();
% dataset    = spm1d.data.mv0d.manova1.Stevens2002();
[y,A]      = deal(dataset.Y, dataset.A);



%(1) Conduct non-parametric test:
alpha      = 0.05;
iterations = 500;
snpm       = spm1d.stats.nonparam.manova1(y, A);
snpmi      = snpm.inference(alpha, 'iterations', iterations);
disp(snpmi)



%(2) Compare to parametric inference:
spmi     = spm1d.stats.manova1(y, A).inference(alpha);
disp('Parametric results')
disp( spmi )
