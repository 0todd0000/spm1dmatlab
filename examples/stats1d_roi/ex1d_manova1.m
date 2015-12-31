    

clear;  clc


%(0) Load data:
dataset    = spm1d.data.mv1d.manova1.Dorn2012();
[Y,A]      = deal(dataset.Y, dataset.A);


%(0a) Create region(s) of interest (ROI):
roi        = false( 1, size(Y,2) );
roi(61:90) = true;


%(1) Conduct SPM analysis:
spm       = spm1d.stats.manova1(Y, A, 'roi', roi);
spmi      = spm.inference(0.05);
disp(spmi)


%(2) Plot:
close all
spmi.plot()





