

clear all;  clc


%(0) Load dataset:
dataset = spm1d.data.uv0d.anova2onerm.RSXLDrug();
% dataset = spm1d.data.uv0d.anova2onerm.Santa23();
% dataset = spm1d.data.uv0d.anova2onerm.Southampton2onerm();
[y,A,B,SUBJ] = deal(dataset.Y, dataset.A, dataset.B, dataset.SUBJ);
disp(dataset)



%(1) Conduct test using spm1d:
spm  = spm1d.stats.anova2onerm(y, A, B, SUBJ);
spmi = spm.inference(0.05);
disp_summ(spmi)



close all
design = spm1d.stats.anova.designs.ANOVA2onerm(A, B, SUBJ);
design.plot()










