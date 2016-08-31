    

clear;  clc


%(0) Load data:
dataset  = spm1d.data.uv1d.anova1.SpeedGRFcategorical();
% dataset  = spm1d.data.uv1d.anova1.Weather();
[y,A]    = deal(dataset.Y, dataset.A);


% calc = spm1d.stats.nonparam.calculators.CalculatorANOVA1(A);
% z    = calc.get_test_stat(y);
% close all;  plot(z)
%
%
% perm  = spm1d.stats.nonparam.permuters.PermuterANOVA1_1D(y, A);
% z = perm.get_test_stat_original();
% % close all;  plot(z)
% perm  = perm.build_pdf(100);




%(1) Conduct non-parametric test:
rng(0)
alpha      = 0.05;
iterations = 100;
snpm       = spm1d.stats.nonparam.anova1(y, A);
snpmi      = snpm.inference(alpha, 'iterations', iterations);
disp('Non-Parametric results')
disp( snpmi )



%(2) Compare to parametric inference:
spm        = spm1d.stats.anova1(y, A);
spmi       = spm.inference(alpha);
disp('Parametric results')
disp( spmi )
% plot:
close all
figure('position', [0 0 1000 300])
subplot(121);  spmi.plot();  spmi.plot_threshold_label();  spmi.plot_p_values();
subplot(122);  snpmi.plot(); snpmi.plot_threshold_label(); snpmi.plot_p_values();




