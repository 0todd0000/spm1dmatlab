    

clear;  clc


%(0) Load data:
dataset    = spm1d.data.mv1d.manova1.Dorn2012();
[Y,A]      = deal(dataset.Y, dataset.A);


%(1) Conduct SPM analysis:
spm       = spm1d.stats.manova1(Y, A);
spmi      = spm.inference(0.05);
disp(spmi)


%(2) Plot:
close all
spmi.plot();
spmi.plot_threshold_label();
spmi.plot_p_values();






