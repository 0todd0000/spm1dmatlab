

clear;  clc


%(0) Load dataset:
dataset   = spm1d.data.uv1d.tpaired.PlantarArchAngle();
[yA,yB]   = deal( dataset.YA, dataset.YB );


 
%(1) Compute confidence intervals:
alpha     = 0.05;
ci0       = spm1d.stats.ci_pairedsample(yA, yB, alpha, 'difference', 0);
ci1       = spm1d.stats.ci_pairedsample(yA, yB, alpha, 'meanA', 'meanB');
ci2       = spm1d.stats.ci_pairedsample(yA, yB, alpha, 'meanA', 'tailB');
disp(ci0)
disp(ci1)
disp(ci2)
%compute (incorrect) one-sample CIs for demonstration:
ciAbad    = spm1d.stats.ci_onesample(yA, alpha);
ciBbad    = spm1d.stats.ci_onesample(yB, alpha);



%(2) Plot:
close all
figure('position', [0 0 1200 500])
myxlim  = [0 size(yA,2)-1];

% plot means and SDs
subplot(231)
spm1d.plot.plot_meanSD(yA);
hold on
spm1d.plot.plot_meanSD(yB, 'color','r');
plot([0 100], [0 0], 'k:')
spm1d.plot.legend_manual({'GroupA','GroupB','Mean','SD'}, 'colors',{0.3*[1 1 1], 'r', 'k', 0.8*[1 1 1]}, 'linewidths',[10 10 3 10], 'linestyles','-', 'location','southwest');
title('Means and SDs')

% plot hypothesis test:
subplot(232)
spmi  = spm1d.stats.ttest_paired(yA, yB).inference(alpha);
spmi.plot();
title('Hypothesis test')

%plot CI (possibility 1)
subplot(233)
ci0.plot()
xlim(myxlim)
title('CI  (possibility 1)')

%plot CI (possibility 2)
subplot(234)
ci1.plot()
xlim(myxlim)
title('CI  (possibility 2)')

%plot CI (possibility 2)
subplot(235)
ci2.plot()
xlim(myxlim)
title('CI  (possibility 3)')

%plot separately computed CIs (INCORRECT!)
subplot(236)
ciAbad.plot('color','k', 'facecolor',0.8*[1 1 1])
ciBbad.plot('color','r', 'facecolor','r')
xlim(myxlim)
title('CIs computed separately  (INCORRECT!)')














