

clear;  clc


%(0) Load dataset:
% dataset = spm1d.data.uv0d.anova1.Cars();
% dataset = spm1d.data.uv0d.anova1.Sound();
% dataset = spm1d.data.uv0d.anova1.Southampton1();
dataset = spm1d.data.uv0d.anova1.ConstructionUnequalSampleSizes();
% dataset = spm1d.data.uv0d.anova1.RSUnequalSampleSizes();
[y,A] = deal(dataset.Y, dataset.A);



%(1) Conduct normality test:
spm   = spm1d.stats.normality.anova1(y, A);
spmi  = spm.inference(0.05);
disp(spmi)

















