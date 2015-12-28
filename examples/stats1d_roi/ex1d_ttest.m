    

clear all;  clc


%(0) Load data:
dataset = spm1d.data.uv1d.t1.Random();
dataset = spm1d.data.uv1d.t1.SimulatedPataky2015a();
% dataset = spm1d.data.uv1d.t1.SimulatedPataky2015b();
[Y,mu]  = deal(dataset.Y, dataset.mu);


%(0a) Create region(s) of interest (ROI):
roi     = zeros( 1, size(Y,2) );
roi(71:80) = 1;


%(1) Conduct SPM analysis:
spm       = spm1d.stats.ttest(Y - mu, 'roi', roi);
% spm       = spm1d.stats.ttest(Y - mu);
spmi      = spm.inference(0.05, 'two_tailed', false);



%(2) Plot:
close all
spmi.plot()
spmi.plot_threshold_label();
spmi.plot_p_values();
















