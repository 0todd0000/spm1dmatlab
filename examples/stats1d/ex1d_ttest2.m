    

clear;  clc


%(0) Load data:
dataset = spm1d.data.uv1d.t2.PlantarArchAngle();
% dataset = spm1d.data.uv1d.t2.SimulatedTwoLocalMax();
[YA,YB] = deal(dataset.YA, dataset.YB);






%(1) Conduct SPM analysis:
spm       = spm1d.stats.ttest2(YA, YB);
spmi      = spm.inference(0.05, 'two_tailed',true, 'interp',true);
disp(spmi)



%(2) Plot:
close all
spmi.plot();
spmi.plot_threshold_label();
spmi.plot_p_values();

















