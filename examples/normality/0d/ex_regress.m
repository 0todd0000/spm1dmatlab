

clear;  clc


%(0) Load data:
dataset  = spm1d.data.uv0d.regress.RSRegression();
% dataset  = spm1d.data.uv0d.regress.ColumbiaHeadCircumference();
[y,x]  = deal(dataset.Y, dataset.x);




%(1) Conduct normality tests:
alpha  = 0.05;
spm    = spm1d.stats.normality.regress(y, x);
spmi   = spm.inference(alpha);
disp(spmi)


















