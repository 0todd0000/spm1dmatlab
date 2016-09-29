

clear;  clc


%(0) Load dataset:
% dataset = spm1d.data.uv0d.anova1.Cars();
% dataset = spm1d.data.uv0d.anova1.Sound();
% dataset = spm1d.data.uv0d.anova1.Southampton1();
% dataset = spm1d.data.uv0d.anova1.ConstructionUnequalSampleSizes();
dataset = spm1d.data.uv0d.anova1.RSUnequalSampleSizes();
[y,A] = deal(dataset.Y, dataset.A);



%(1) Conduct non-parametric test:
alpha      = 0.05;
iterations = 500;
snpm       = spm1d.stats.nonparam.anova1(y, A);
snpmi      = snpm.inference(alpha, 'iterations', iterations);
disp('Non-parametric results')
disp(snpmi)



%(2) Compare to parametric inference:
spmi     = spm1d.stats.anova1(y, A).inference(alpha);
disp('Parametric results')
disp( spmi )














