    

clear;  clc


%(0) Load data:
dataset  = spm1d.data.uv1d.anova1.SpeedGRFcategorical();
% dataset  = spm1d.data.uv1d.anova1.Weather();
[y,A]    = deal(dataset.Y, dataset.A);


%(1) Conduct normality test:
alpha     = 0.05;
spm       = spm1d.stats.normality.anova1(y, A);
spmi      = spm.inference(0.05);
disp(spmi)


%(2) Plot:
close all
figure('position', [0 0  1200 300])
subplot(131);  plot(y', 'k');  hold on;  title('Data')
subplot(132);  plot(spm.residuals', 'k');  title('Residuals')
subplot(133);  spmi.plot();  title('Normality test')

















