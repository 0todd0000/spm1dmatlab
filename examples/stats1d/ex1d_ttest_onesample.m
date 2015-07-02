

clear all;  clc


%(0) Load dataset:
dataset = spm1d.data.uv1d.t1.Random();
dataset = spm1d.data.uv1d.t1.SimulatedPataky2015a();
dataset = spm1d.data.uv1d.t1.SimulatedPataky2015b();
Y       = dataset.Y;


%(1) Conduct test using spm1d:
spm = spm1d.stats.ttest(Y);
spmi = spm.inference(0.05, 'two_tailed', false);
disp(spmi)


%(2) Plot results
close all
%create figure and axes
figure('Position',[100,100,800,350])
ax0 = axes('Position', [0.10,0.15,0.35,0.8]);
ax1 = axes('Position', [0.55,0.15,0.35,0.8]);
%plot mean & SD curves:
axes(ax0)
[hA0,hA1] = spm1d.plot.plot_meanSD(Y);
xlim([0 100])
xlabel('Time (%)')
ylabel('Dependent variable')
%plot SPM results:
spmi.plot(ax1)
spmi.plot_threshold_label(50, 3.6);
spmi.plot_p_values('offset',[1 0.1]);


















