

clear;  clc


%(0) Load dataset:
% dataset   = spm1d.data.uv0d.anova3.RSItalian();
dataset   = spm1d.data.uv0d.anova3.SouthamptonFullyCrossedMixed();
[y,A,B,C] = deal(dataset.Y, dataset.A, dataset.B, dataset.C);



%(1) Conduct normality test:
spm   = spm1d.stats.normality.anova3(y, A, B, C);
spmi  = spm.inference(0.05);
disp(spmi)









