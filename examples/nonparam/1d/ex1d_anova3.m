    

clear;  clc



%(0) Load data:
dataset    = spm1d.data.uv1d.anova3.SPM1D_ANOVA3_2x2x2();
% dataset    = spm1d.data.uv1d.anova3.SPM1D_ANOVA3_2x3x4();
[y,A,B,C]  = deal(dataset.Y, dataset.A, dataset.B, dataset.C);


%(1) Conduct non-parametric test:
rng(0)     %set the random number generator seed
alpha      = 0.05;
iterations = 100;
FFn        = spm1d.stats.nonparam.anova3(y, A, B, C);
FFni       = FFn.inference(alpha, 'iterations', iterations);
disp_summ(FFni)



%(2) Plot:
close all;
FFni.plot('plot_threshold_label',false, 'plot_p_values',false, 'autoset_ylim',false);
FFi        = spm1d.stats.anova3(y, A, B, C).inference(alpha);
%%% compare to parametric results by plotting the parametric thresholds:
for i = 1:FFi.nEffects
    Fi = FFi(i);
    subplot(3,3,i);
    hold on
    plot([0 numel(Fi.z)], Fi.zstar*[1 1], 'color','c', 'linestyle','--')
    hold off
    text(5, Fi.zstar, 'Parametric', 'color','k', 'backgroundcolor','c')
end
