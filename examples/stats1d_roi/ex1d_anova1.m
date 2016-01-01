    

clear;  clc


%(0) Load data:
% dataset  = spm1d.data.uv1d.anova1.SpeedGRFcategorical();
dataset  = spm1d.data.uv1d.anova1.Weather();
[Y,A]    = deal(dataset.Y, dataset.A);



%(0a) Create region(s) of interest (ROI):
roi          = false( 1, size(Y,2) );
roi(1:100)   = true;
roi(180:end) = true;



%(1) Conduct SPM analysis:
spm       = spm1d.stats.anova1(Y, A, 'roi', roi);
spmi      = spm.inference(0.00005, 'circular', true);
disp(spmi)




%(2) Plot:
close all
spmi.plot()
spmi.plot_threshold_label();
spmi.plot_p_values();



