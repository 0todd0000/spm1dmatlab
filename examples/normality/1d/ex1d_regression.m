    

clear;  clc


%(0) Load data:
dataset = spm1d.data.uv1d.regress.SimulatedPataky2015c();
% dataset = spm1d.data.uv1d.regress.SpeedGRF();
[y,x]  = deal(dataset.Y, dataset.x);


%(1) Conduct normality test:
alpha     = 0.05;
spm       = spm1d.stats.normality.regress(y, x);
spmi      = spm.inference(0.05);
disp(spmi)


%(2) Plot:
close all
figure('position', [0 0  1200 300])
subplot(131);  plot(y', 'k');  title('Data')
subplot(132);  plot(spm.residuals', 'k');  title('Residuals')
subplot(133);  spmi.plot();  title('Normality test')

















