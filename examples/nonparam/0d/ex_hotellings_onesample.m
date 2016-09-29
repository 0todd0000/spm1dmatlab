

clear;  clc


%(0) Load dataset:
% dataset  = spm1d.data.mv0d.hotellings1.RSXLHotellings1();
dataset  = spm1d.data.mv0d.hotellings1.Sweat();
[y,mu]   = deal(dataset.Y, dataset.mu);



%(1) Conduct non-parametric test:
rng(0)
alpha      = 0.05;
snpm       = spm1d.stats.nonparam.hotellings(y, mu);
snpmi      = snpm.inference(alpha, 'iterations', 5000);
disp('Non-parametric results')
disp( snpmi )



%(2) Compare to parametric inference:
spm        = spm1d.stats.hotellings(y, mu);
spmi       = spm.inference(alpha);
disp('Parametric results')
disp( spmi )












