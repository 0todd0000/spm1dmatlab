

clear;  clc


%(0) Load dataset:
dataset = spm1d.data.uv0d.anova2onerm.RSXLDrug();
% dataset = spm1d.data.uv0d.anova2onerm.Santa23();
% dataset = spm1d.data.uv0d.anova2onerm.Southampton2onerm();
% dataset = spm1d.data.uv0d.anova2onerm.Santa23UnequalSampleSizes();
% dataset = spm1d.data.uv0d.anova2onerm.Southampton2onermUnequalSampleSizes();
[y,A,B,SUBJ] = deal(dataset.Y, dataset.A, dataset.B, dataset.SUBJ);




%(1) Conduct normality test:
spm   = spm1d.stats.normality.anova2onerm(y, A, B, SUBJ);
spmi  = spm.inference(0.05);
disp(spmi)










