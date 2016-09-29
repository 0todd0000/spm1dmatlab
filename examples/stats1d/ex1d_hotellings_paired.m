    

clear;  clc


%(0) Load data:
dataset    = spm1d.data.mv1d.hotellings_paired.Neptune1999kneekin();
dataset    = spm1d.data.mv1d.hotellings_paired.Pataky2014cop();
[YA,YB]    = deal(dataset.YA, dataset.YB);


%(1) Conduct SPM analysis:
spm       = spm1d.stats.hotellings_paired(YA, YB);
spmi      = spm.inference(0.05);
disp(spmi)


%(2) Plot:
close all
spmi.plot();
spmi.plot_threshold_label();
spmi.plot_p_values();





