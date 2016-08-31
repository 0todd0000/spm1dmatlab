    

clear;  clc


%(0) Load data:
dataset    = spm1d.data.uv1d.anova2.SPM1D_ANOVA2_2x2();
% dataset    = spm1d.data.uv1d.anova2.SPM1D_ANOVA2_2x3();
% dataset    = spm1d.data.uv1d.anova2.SPM1D_ANOVA2_3x3();
% dataset    = spm1d.data.uv1d.anova2.SPM1D_ANOVA2_3x4();
% dataset    = spm1d.data.uv1d.anova2.SPM1D_ANOVA2_3x5();
% dataset    = spm1d.data.uv1d.anova2.SPM1D_ANOVA2_4x4();
% dataset    = spm1d.data.uv1d.anova2.SPM1D_ANOVA2_4x5();
[y,A,B] = deal(dataset.Y, dataset.A, dataset.B);


% calc = spm1d.stats.nonparam.calculators.CalculatorANOVA2(A, B);
% z    = calc.get_test_stat(y);
% % close all;  plot(z)


% perm  = spm1d.stats.nonparam.permuters.PermuterANOVA2_1D(y, A, B);
% z = perm.get_test_stat_original();
% % % % close all;  plot(z)
% perm  = perm.build_pdf(100);




%(1) Conduct non-parametric test:
rng(0)
alpha      = 0.05;
iterations = 100;
snpm       = spm1d.stats.nonparam.anova2(y, A, B);
snpmi      = snpm.inference(alpha, 'iterations', iterations);
% disp('Non-Parametric results')
% disp( snpmi )



% %(2) Compare to parametric inference:
% spmlist    = spm1d.stats.anova2(y, A, B);
% spmilist   = spmlist.inference(alpha);
% disp('Parametric results')
% disp( spmilist )
% % plot:
% close all
% spmilist.plot('FigureName', 'Parametric results')
% % subplot(122);  snpmi.plot(); snpmi.plot_threshold_label(); snpmi.plot_p_values();
%


