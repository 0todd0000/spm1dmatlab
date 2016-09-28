    

clear;  clc


%(0) Load data:
dataset    = spm1d.data.uv1d.anova3tworm.SPM1D_ANOVA3TWORM_2x2x2();
% dataset    = spm1d.data.uv1d.anova3tworm.SPM1D_ANOVA3TWORM_2x3x4();
[Y,A,B,C,SUBJ]  = deal(dataset.Y, dataset.A, dataset.B, dataset.C, dataset.SUBJ);


%(1) Conduct SPM analysis:
spmlist   = spm1d.stats.anova3tworm(Y, A, B, C, SUBJ);
spmilist  = spmlist.inference(0.05);
disp_summ(spmilist)


%(2) Plot:
close all
spmilist.plot('plot_threshold_label',false, 'plot_p_values',true, 'autoset_ylim',true);


