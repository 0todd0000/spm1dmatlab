

clear;  clc


%(0) Load dataset:
% dataset   = spm1d.data.uv0d.tpaired.RSWeightClinic();
dataset   = spm1d.data.uv0d.tpaired.ColumbiaMileage();
[yA,yB]  = deal(dataset.YA, dataset.YB);



%(1) Conduct normality test:
spm   = spm1d.stats.normality.ttest_paired(yA, yB);
spmi  = spm.inference(0.05);
disp(spmi)

















