    

clear;  clc


%(0) Load data:
dataset    = spm1d.data.mv1d.cca.Dorn2012();
[Y,x]      = deal(dataset.Y, dataset.x);


%(1) Conduct SPM analysis:
spm       = spm1d.stats.cca(Y, x);
spmi      = spm.inference(0.05);
disp(spmi)


%(2) Plot:
close all
spmi.plot();
spmi.plot_threshold_label();
spmi.plot_p_values();





