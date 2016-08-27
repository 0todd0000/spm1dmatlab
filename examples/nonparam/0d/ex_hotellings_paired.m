

clear;  clc


%(0) Load dataset:
dataset  = spm1d.data.mv0d.hotellings_paired.NCSSBeforeAfter();
% dataset  = spm1d.data.mv0d.hotellings_paired.RSXLHotellingsPaired();
[yA,yB]   = deal(dataset.YA, dataset.YB);


%(1) Conduct non-parametric test:
rng(0)
alpha      = 0.05;
snpm       = spm1d.stats.nonparam.hotellings_paired(yA, yB);
snpmi      = snpm.inference(alpha, 'iterations', -1);
disp('Non-parametric results')
disp( snpmi )



%(2) Compare to parametric inference:
spm        = spm1d.stats.hotellings_paired(yA, yB);
spmi       = spm.inference(alpha);
disp('Parametric results')
disp( spmi )













