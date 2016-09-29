    

clear;  clc


%(0) Load data:
% dataset    = spm1d.data.uv1d.anova2nested.SPM1D_ANOVA2NESTED_2x2();
% dataset    = spm1d.data.uv1d.anova2nested.SPM1D_ANOVA2NESTED_2x3();
dataset    = spm1d.data.uv1d.anova2nested.SPM1D_ANOVA2NESTED_3x3();
% dataset    = spm1d.data.uv1d.anova2nested.SPM1D_ANOVA2NESTED_3x4();
% dataset    = spm1d.data.uv1d.anova2nested.SPM1D_ANOVA2NESTED_3x5();
% dataset    = spm1d.data.uv1d.anova2nested.SPM1D_ANOVA2NESTED_4x4();
% dataset    = spm1d.data.uv1d.anova2nested.SPM1D_ANOVA2NESTED_4x5();
[Y,A,B] = deal(dataset.Y, dataset.A, dataset.B);


%(1) Conduct SPM analysis:
spmlist   = spm1d.stats.anova2nested(Y, A, B);
spmilist  = spmlist.inference(0.05);
disp_summ(spmilist)
close all
spmilist.plot();



%(2) Plot:
close all
spmilist.plot('plot_threshold_label',false, 'plot_p_values',true, 'autoset_ylim',true);

