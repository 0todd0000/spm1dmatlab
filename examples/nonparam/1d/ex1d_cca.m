    

clear;  clc


%(0) Load data:
dataset    = spm1d.data.mv1d.cca.Dorn2012();
[y,x]      = deal(dataset.Y, dataset.x);


% [J,Q,I] = size(y);
%
%
% calc = spm1d.stats.nonparam.calculators.CalculatorCCA(x, I, Q);
% z    = calc.get_test_stat(y);
% close all;  plot(z)
%
% perm  = spm1d.stats.nonparam.permuters.PermuterCCA_1D(y, x);
% z = perm.get_test_stat_original();
% hold on;  plot(z, 'r')
% % % % close all;  plot(z)
% % % hold on;   plot(z)
% % perm  = perm.build_pdf(100);
% % % %



%(1) Conduct non-parametric test:
rng(0)
alpha      = 0.05;
iterations = 100;
snpm = spm1d.stats.nonparam.cca(y, x);
snpmi      = snpm.inference(alpha, 'iterations', iterations);
disp('Non-Parametric results')
disp( snpmi )



%(2) Compare to parametric inference:
spm        = spm1d.stats.cca(y, x);
spmi       = spm.inference(alpha);
disp('Parametric results')
disp( spmi )
% plot:
close all
figure('position', [0 0 1000 300])
subplot(121);  spmi.plot();  spmi.plot_threshold_label();  spmi.plot_p_values();
subplot(122);  snpmi.plot(); snpmi.plot_threshold_label(); snpmi.plot_p_values();


