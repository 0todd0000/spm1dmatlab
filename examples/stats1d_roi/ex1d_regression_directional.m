    

clear;  clc


%(0) Load data:
dataset = spm1d.data.uv1d.regress.SpeedGRF();
[Y,x]  = deal(dataset.Y, dataset.x);



%(0a) Create region(s) of interest (ROI):
roi        = zeros( 1, size(Y,2) );
roi(1:20)  = +1;
roi(31:65) = -1;




%(1) Conduct SPM analysis:
spm       = spm1d.stats.regress(Y, x, 'roi', roi);
spmi      = spm.inference(0.05, 'two_tailed', false);
disp(spmi)



%(2) Plot:
close all
spmi.plot()
spmi.plot_threshold_label();
% spmi.plot_p_values();

















