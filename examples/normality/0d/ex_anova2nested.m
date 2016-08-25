

clear;  clc


%(0) Load dataset:
dataset = spm1d.data.uv0d.anova2nested.QIMacros();
% dataset = spm1d.data.uv0d.anova2nested.SouthamptonNested1();
[y,A,B] = deal(dataset.Y, dataset.A, dataset.B);




%(1) Conduct normality test:
spm   = spm1d.stats.normality.anova2nested(y, A, B);
spmi  = spm.inference(0.05);
disp(spmi)


