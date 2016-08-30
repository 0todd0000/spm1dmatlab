    

clear;  clc


%(0) Load data:
dataset    = spm1d.data.mv1d.hotellings2.Besier2009muscleforces();
[YA,YB]    = deal(dataset.YA, dataset.YB);


%(1) Conduct SPM analysis:
spm       = spm1d.stats.hotellings2(YA, YB);
spmi      = spm.inference(0.05);
disp(spmi)


%(2) Plot:
close all
spmi.plot();
spmi.plot_threshold_label();
spmi.plot_p_values();





