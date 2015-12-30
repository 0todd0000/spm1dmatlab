

clear;  clc


%(0) Load dataset:
dataset = spm1d.data.uv0d.anova3rm.SPM1D2x2x2();
dataset = spm1d.data.uv0d.anova3rm.SPM1D2x3x5();
dataset = spm1d.data.uv0d.anova3rm.SPM1D3x3x3();
[y,A,B,C,SUBJ] = deal(dataset.Y, dataset.A, dataset.B, dataset.C, dataset.SUBJ);
disp(dataset)



%(1) Conduct test using spm1d:
spm  = spm1d.stats.anova3rm(y, A, B, C, SUBJ);
spmi = spm.inference(0.05);
disp_summ(spmi)


