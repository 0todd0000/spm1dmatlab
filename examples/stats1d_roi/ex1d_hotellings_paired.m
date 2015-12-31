    

clear;  clc


%(0) Load data:
dataset    = spm1d.data.mv1d.hotellings_paired.Neptune1999kneekin();
[YA,YB]    = deal(dataset.YA, dataset.YB);


%(0a) Create region(s) of interest (ROI):
roi        = false( 1, size(YA,2) );
roi(21:50)  = true;


%(1) Conduct SPM analysis:
spm       = spm1d.stats.hotellings_paired(YA, YB, 'roi', roi);
spmi      = spm.inference(0.05);
disp(spmi)


%(2) Plot:
close all
spmi.plot()





