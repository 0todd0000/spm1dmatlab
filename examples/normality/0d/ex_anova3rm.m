

clear;  clc


%(0) Load dataset:
dataset = spm1d.data.uv0d.anova3rm.SPM1D2x2x2();
% dataset = spm1d.data.uv0d.anova3rm.SPM1D2x3x5();
% dataset = spm1d.data.uv0d.anova3rm.SPM1D3x3x3();
[y,A,B,C,SUBJ] = deal(dataset.Y, dataset.A, dataset.B, dataset.C, dataset.SUBJ);



%(1) Conduct normality test:
spm   = spm1d.stats.normality.anova3rm(y, A, B, C, SUBJ);
spmi  = spm.inference(0.05);
disp(spmi)


