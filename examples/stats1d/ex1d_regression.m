    

clear;  clc


%(0) Load data:
% dataset = spm1d.data.uv1d.regress.SimulatedPataky2015c();
dataset = spm1d.data.uv1d.regress.SpeedGRF();
[Y,x]  = deal(dataset.Y, dataset.x);



%(1) Conduct SPM analysis:
spm       = spm1d.stats.regress(Y, x);
spmi      = spm.inference(0.05, 'two_tailed', false);



%(2) Plot:
close all
spmi.plot();
spmi.plot_threshold_label();
spmi.plot_p_values();

















