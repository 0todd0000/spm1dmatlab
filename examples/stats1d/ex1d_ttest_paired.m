    

clear;  clc


%(0) Load dataset:
dataset = spm1d.data.uv1d.tpaired.PlantarArchAngle();
[YA,YB] = deal(dataset.YA, dataset.YB);


%(1) Conduct SPM analysis:
spm       = spm1d.stats.ttest_paired(YA, YB);
spmi      = spm.inference(0.05, 'two_tailed', false, 'interp',true);
disp(spmi)


%(2) Plot:
close all
figure('position', [0 0 1000 300])
%%% plot mean and SD:
subplot(121)
spm1d.plot.plot_meanSD(YA, 'color','k');
hold on
spm1d.plot.plot_meanSD(YB, 'color','r');
title('Mean and SD')
%%% plot SPM results:
subplot(122)
spmi.plot();
spmi.plot_threshold_label();
spmi.plot_p_values();
title('Hypothesis test')
















