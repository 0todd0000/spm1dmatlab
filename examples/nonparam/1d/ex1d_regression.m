    

clear;  clc


%(0) Load data:
% dataset = spm1d.data.uv1d.regress.SimulatedPataky2015c();
dataset = spm1d.data.uv1d.regress.SpeedGRF();
[y,x]  = deal(dataset.Y, dataset.x);



%(1) Conduct non-parametric test:
rng(0)
alpha      = 0.05;
two_tailed = true;
iterations = 500;
snpm       = spm1d.stats.nonparam.regress(y, x);
snpmi      = snpm.inference(alpha, 'two_tailed', two_tailed, 'iterations', iterations);
disp('Non-Parametric results')
disp( snpmi )



%(2) Compare to parametric inference:
spm        = spm1d.stats.regress(y, x);
spmi       = spm.inference(alpha, 'two_tailed',two_tailed);
disp('Parametric results')
disp( spmi )
% plot:
close all
figure('position', [0 0 1000 300])
subplot(121);  spmi.plot();  spmi.plot_threshold_label();  spmi.plot_p_values();
subplot(122);  snpmi.plot(); snpmi.plot_threshold_label(); snpmi.plot_p_values();















