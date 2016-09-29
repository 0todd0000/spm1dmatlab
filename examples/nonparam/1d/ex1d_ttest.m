
clear;  clc



%(0) Load data:
% dataset = spm1d.data.uv1d.t1.Random();
% dataset = spm1d.data.uv1d.t1.SimulatedPataky2015a();
dataset = spm1d.data.uv1d.t1.SimulatedPataky2015b();
[y,mu]  = deal(dataset.Y, dataset.mu);



%(1) Conduct non-parametric test:
rng(0)
alpha      = 0.05;
two_tailed = true;
iterations = -1;
snpm       = spm1d.stats.nonparam.ttest(y, mu);
snpmi      = snpm.inference(alpha, 'two_tailed', two_tailed, 'iterations', iterations);
disp('Non-Parametric results')
disp( snpmi )



%(2) Compare to parametric inference:
spm        = spm1d.stats.ttest(y, mu);
spmi       = spm.inference(alpha, 'two_tailed',two_tailed);
disp('Parametric results')
disp( spmi )
% plot:
close all
figure('position', [0 0 1000 300])
subplot(121);  spmi.plot();  spmi.plot_threshold_label();  spmi.plot_p_values();
subplot(122);  snpmi.plot(); snpmi.plot_threshold_label(); snpmi.plot_p_values();












