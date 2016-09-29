

clear;  clc


%(0) Load dataset:
% dataset   = spm1d.data.uv0d.normality.ZarBiostatisticalAnalysis68();
dataset   = spm1d.data.uv0d.normality.KendallRandomNumbers();
y         = dataset.Y;
fprintf('Expected results:\n')
fprintf('    K2 = %s\n', dataset.z)
fprintf('    p  = %s\n', dataset.p)



%(1) Conduct normality test:
spm   = spm1d.stats.normality.ttest(y);
spmi  = spm.inference(0.05);
disp(spmi)

















