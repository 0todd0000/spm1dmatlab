    

clear;  clc


%(0) Load dataset:
dataset = spm1d.data.uv1d.tpaired.PlantarArchAngle();
[Y1,Y2] = deal(dataset.YA, dataset.YB);


%(1) Conduct SPM analysis:
spm       = spm1d.stats.ttest_paired(Y1, Y2);
spmi      = spm.inference(0.05, 'two_tailed', false, 'interp',true);
disp(spmi)


%(2) Plot:
close all
spmi.plot()
spmi.plot_threshold_label();
spmi.plot_p_values();

















