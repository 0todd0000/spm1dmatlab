    

clear;  clc


%(0) Load data:
% dataset    = spm1d.data.uv1d.anova2.SPM1D_ANOVA2_2x2();
dataset    = spm1d.data.uv1d.anova2.SPM1D_ANOVA2_2x3();
[y,A,B] = deal(dataset.Y, dataset.A, dataset.B);


%(1) Conduct normality test:
alpha     = 0.05;
spm       = spm1d.stats.normality.anova1rm(y, A, B);
spmi      = spm.inference(0.05);
disp(spmi)


%(2) Plot:
close all
figure('position', [0 0  1200 300])
subplot(131);  plot(y', 'k');  hold on;  title('Data')
subplot(132);  plot(spm.residuals', 'k');  title('Residuals')
subplot(133);  spmi.plot();  title('Normality test')

















