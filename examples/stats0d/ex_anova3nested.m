

clear;  clc


%(0) Load dataset:
dataset = spm1d.data.uv0d.anova3nested.SouthamptonNested3();
[y,A,B,C] = deal(dataset.Y, dataset.A, dataset.B, dataset.C);
disp(dataset)


%(1) Conduct test using spm1d:
spm  = spm1d.stats.anova3nested(y, A, B, C);
spmi = spm.inference(0.05);
disp_summ(spmi)






