

clear;  clc


%(0) Load dataset:
dataset = spm1d.data.uv0d.anova2.Detergent();
% dataset = spm1d.data.uv0d.anova2.Mouse();
% dataset = spm1d.data.uv0d.anova2.Satisfaction();
% dataset = spm1d.data.uv0d.anova2.SouthamptonCrossed1();
[y,A,B] = deal(dataset.Y, dataset.A, dataset.B);




%(1) Conduct normality test:
spm   = spm1d.stats.normality.anova2(y, A, B);
spmi  = spm.inference(0.05);
disp(spmi)

















