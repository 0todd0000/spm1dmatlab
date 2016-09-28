    

clear;  clc


%(0) Load data:
dataset    = spm1d.data.uv1d.anova2onerm.SPM1D_ANOVA2ONERM_2x2();
% dataset    = spm1d.data.uv1d.anova2onerm.SPM1D_ANOVA2ONERM_2x3();
% dataset    = spm1d.data.uv1d.anova2onerm.SPM1D_ANOVA2ONERM_3x3();
% dataset    = spm1d.data.uv1d.anova2onerm.SPM1D_ANOVA2ONERM_3x4();
% dataset    = spm1d.data.uv1d.anova2onerm.SPM1D_ANOVA2ONERM_3x5();
% dataset    = spm1d.data.uv1d.anova2onerm.SPM1D_ANOVA2ONERM_4x4();
% dataset    = spm1d.data.uv1d.anova2onerm.SPM1D_ANOVA2ONERM_4x5();
[y,A,B,SUBJ] = deal(dataset.Y, dataset.A, dataset.B, dataset.SUBJ);


%(1) Conduct non-parametric test:
rng(0)     %set the random number generator seed
alpha      = 0.05;
iterations = 500;
FFn        = spm1d.stats.nonparam.anova2onerm(y, A, B, SUBJ);
FFni       = FFn.inference(alpha, 'iterations', iterations);
disp_summ(FFni)



%(2) Plot:
close all;
FFni.plot('plot_threshold_label',false, 'plot_p_values',false, 'autoset_ylim',true);
FFi        = spm1d.stats.anova2onerm(y, A, B, SUBJ).inference(alpha);
%%% compare to parametric results by plotting the parametric thresholds:
for i = 1:FFi.nEffects
    Fi = FFi(i);
    subplot(2,2,i);
    hold on
    plot([0 numel(Fi.z)], Fi.zstar*[1 1], 'color','c', 'linestyle','--')
    hold off
    text(5, Fi.zstar, 'Parametric', 'color','k', 'backgroundcolor','c')
end


