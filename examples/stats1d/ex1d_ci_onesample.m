

clear;  clc


%(0) Load dataset:
% dataset = spm1d.data.uv1d.t1.Random();
% dataset = spm1d.data.uv1d.t1.SimulatedPataky2015a();
dataset = spm1d.data.uv1d.t1.SimulatedPataky2015b();
y       = dataset.Y;
mu0     = 0;    %null criterion
mu1     = 5 * sin( linspace(0, pi, size(y,2)) );  %arbitrary criterion


%(1) Compute confidence intervals:
alpha = 0.05;
ci0   = spm1d.stats.ci_onesample(y, alpha, mu0);
ci1   = spm1d.stats.ci_onesample(y, alpha, mu1);
disp(ci0)
%hypothesis tests:
spmi0 = spm1d.stats.ttest(y, mu0).inference(alpha);
spmi1 = spm1d.stats.ttest(y, mu1).inference(alpha);
%plot
close all
figure('position', [0 0 1200 500])
subplot(231);  spm1d.plot.plot_meanSD(y - mu0); hold on;  plot([0 100], [0 0], 'k:');  title('Mean and SD (y - mu0)')
spm1d.plot.legend_manual({'Mean','SD'}, 'colors',{'k', 0.7*[1 1 1]}, 'linewidths',[3 10], 'location','northwest');
subplot(232);  spmi0.plot();  title('Hypothesis test')
subplot(233);  ci0.plot();  title('CI (criterion: mu0)')
spm1d.plot.legend_manual({'Mean','CI','Criterion'}, 'colors',{'k', 0.8*[1 1 1], 'r'}, 'linewidths',[3 10, 1], 'linestyles',{'-','-','--'}, 'location','northwest');

%second CI:
subplot(234);  spm1d.plot.plot_meanSD(y - repmat(mu1, [size(y,1) 1])); hold on;  plot([0 100], [0 0], 'k:');  title('Mean and SD (y - mu1)')
subplot(235);  spmi1.plot();  title('Hypothesis test')
subplot(236);  ci1.plot();  title('CI (criterion: mu1)')














