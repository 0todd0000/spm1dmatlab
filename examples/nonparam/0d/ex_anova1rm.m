

clear;  clc


%(0) Load dataset:
dataset    = spm1d.data.uv0d.anova1rm.Abdi2010();
% dataset    = spm1d.data.uv0d.anova1rm.Groceries();
% dataset    = spm1d.data.uv0d.anova1rm.Imacelebrity();
% dataset    = spm1d.data.uv0d.anova1rm.Southampton1rm();
[y,A,SUBJ] = deal(dataset.Y, dataset.A, dataset.SUBJ);



%(1) Conduct non-parametric test:
alpha      = 0.05;
iterations = 500;
snpm       = spm1d.stats.nonparam.anova1rm(y, A, SUBJ);
snpmi      = snpm.inference(alpha, 'iterations', iterations);
disp(snpmi)



%(2) Compare to parametric inference:
spmi     = spm1d.stats.anova1rm(y, A, SUBJ).inference(alpha);
disp('Parametric results')
disp( spmi )




