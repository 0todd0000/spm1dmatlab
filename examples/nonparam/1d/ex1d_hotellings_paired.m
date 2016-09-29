    

clear;  clc


%(0) Load data:
dataset    = spm1d.data.mv1d.hotellings_paired.Neptune1999kneekin();
dataset    = spm1d.data.mv1d.hotellings_paired.Pataky2014cop();
[yA,yB]    = deal(dataset.YA, dataset.YB);



%(1) Conduct non-parametric test:
rng(0)
alpha      = 0.05;
iterations = 500;
snpm       = spm1d.stats.nonparam.hotellings_paired(yA, yB);
snpmi      = snpm.inference(alpha, 'iterations', iterations);
disp('Non-Parametric results')
disp( snpmi )



%(2) Compare to parametric inference:
spm        = spm1d.stats.hotellings_paired(yA, yB);
spmi       = spm.inference(alpha);
disp('Parametric results')
disp( spmi )
% plot:
close all
figure('position', [0 0 1000 300])
subplot(121);  spmi.plot();  spmi.plot_threshold_label();  spmi.plot_p_values();
subplot(122);  snpmi.plot(); snpmi.plot_threshold_label(); snpmi.plot_p_values();




