

clear;  clc


%(0) Load dataset:
dataset = spm1d.data.uv0d.anova2rm.Antidepressant();
dataset = spm1d.data.uv0d.anova2rm.RSXLTraining();
% dataset = spm1d.data.uv0d.anova2rm.SocialNetworks();
% dataset = spm1d.data.uv0d.anova2rm.Southampton2rm();
[y,A,B,SUBJ] = deal(dataset.Y, dataset.A, dataset.B, dataset.SUBJ);
disp(dataset)



%(1) Conduct test using spm1d:
spm  = spm1d.stats.anova2rm(y, A, B, SUBJ);
spmi = spm.inference(0.05);
disp_summ(spmi)







