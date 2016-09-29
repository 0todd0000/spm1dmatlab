

clear;  clc


%(0) Load dataset:
% dataset  = spm1d.data.mv0d.hotellings2.RSXLHotellings2();
dataset  = spm1d.data.mv0d.hotellings2.HELPHomeless();
[yA,yB]   = deal(dataset.YA, dataset.YB);



%(1) Conduct non-parametric test:
rng(0)
alpha      = 0.05;
snpm       = spm1d.stats.nonparam.hotellings2(yA, yB);
snpmi      = snpm.inference(alpha, 'iterations', 1000);
disp('Non-parametric results')
disp( snpmi )



%(2) Compare to parametric inference:
spm        = spm1d.stats.hotellings2(yA, yB);
spmi       = spm.inference(alpha);
disp('Parametric results')
disp( spmi )






