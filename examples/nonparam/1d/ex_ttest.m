
clear classes;  clc



%(0) Load data:
dataset = spm1d.data.uv1d.t1.Random();
% dataset = spm1d.data.uv1d.t1.SimulatedPataky2015a();
dataset = spm1d.data.uv1d.t1.SimulatedPataky2015b();
[y,mu]  = deal(dataset.Y, dataset.mu);


% J = size(y,1);
% calc = spm1d.stats.nonparam.calculators.CalculatorTtest(J, mu);
% z    = calc.get_test_stat(y);
% close all;  plot(z)

% metric  = spm1d.stats.nonparam.metrics.MaxClusterExtent();
% metric  = spm1d.stats.nonparam.metrics.MaxClusterHeight();
% metric  = spm1d.stats.nonparam.metrics.MaxClusterIntegral();
% % metric.get_label_single()
%
%
% z = mean(y,1);
% zstar = 10;
% circular = false;
%
%
% x = metric.get_all_cluster_metrics(z, zstar, circular)
% x = metric.get_max_metric(z, zstar, circular)






%
% perm  = spm1d.stats.nonparam.permuters.PermuterTtest_1D(y, mu);
% % % z = perm.get_test_stat_original();
% % % close all;  plot(z)
% perm  = perm.build_pdf(100);
% zstar = perm.get_z_critical(0.05);
% perm  = perm.build_secondary_pdf(zstar, false);



%(1) Conduct non-parametric test:
rng(0)
alpha      = 0.05;
two_tailed = false;
iterations = -1;
snpm       = spm1d.stats.nonparam.ttest(y, mu);
snpmi      = snpm.inference(alpha, 'two_tailed', two_tailed, 'iterations', iterations);
disp('Non-Parametric results')
disp( snpmi )



% % % snpmi      = snpm.inference(alpha, 'two_tailed', two_tailed, 'iterations', iterations);

% disp('Non-parametric results')
% disp( snpmi )


%(2) Compare to parametric inference:
spm        = spm1d.stats.ttest(y, mu);
spmi       = spm.inference(alpha, 'two_tailed',two_tailed);
disp('Parametric results')
disp( spmi )




close all
subplot(221);  spmi.plot()
subplot(222);  snpmi.plot()












