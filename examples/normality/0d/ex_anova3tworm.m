

clear;  clc


%(0) Load dataset:
% dataset = spm1d.data.uv0d.anova3tworm.NYUHiringExperience();
dataset = spm1d.data.uv0d.anova3tworm.Southampton3tworm();
[y,A,B,C,SUBJ] = deal(dataset.Y, dataset.A, dataset.B, dataset.C, dataset.SUBJ);



%(1) Conduct normality test:
spm   = spm1d.stats.normality.anova3tworm(y, A, B, C, SUBJ);
spmi  = spm.inference(0.05);
disp(spmi)












