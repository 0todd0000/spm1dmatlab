    

clear;  clc


%(0) Load data:
dataset    = spm1d.data.uv1d.anova3nested.SPM1D_ANOVA3NESTED_2x2x2();
[Y,A,B,C]  = deal(dataset.Y, dataset.A, dataset.B, dataset.C);


%(0a) Create region(s) of interest (ROI):
roi        = false( 1, size(Y,2) );
roi(81:end) = true;


%(1) Conduct SPM analysis:
spmlist   = spm1d.stats.anova3nested(Y, A, B, C, 'roi', roi);
spmilist  = spmlist.inference(0.05);


%(2) Plot: 
close all
spmilist.plot('plot_threshold_label',true, 'plot_p_values',true, 'autoset_ylim',true);
    









