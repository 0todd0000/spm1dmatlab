

clear;  clc


%(0) Load dataset:
% dataset    = spm1d.data.uv0d.anova1rm.Abdi2010();
% dataset    = spm1d.data.uv0d.anova1rm.Groceries();
% dataset    = spm1d.data.uv0d.anova1rm.Imacelebrity();
dataset    = spm1d.data.uv0d.anova1rm.Southampton1rm();
[y,A,SUBJ] = deal(dataset.Y, dataset.A, dataset.SUBJ);



%(1) Conduct normality test:
spm   = spm1d.stats.normality.anova1rm(y, A, SUBJ);
spmi  = spm.inference(0.05);
disp(spmi)

