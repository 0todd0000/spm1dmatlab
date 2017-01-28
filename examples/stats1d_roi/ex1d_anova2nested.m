    

clear;  clc


%(0) Load data:
dataset    = spm1d.data.uv1d.anova2nested.SPM1D_ANOVA2NESTED_2x2();
[Y,A,B] = deal(dataset.Y, dataset.A, dataset.B);


%(0a) Create region(s) of interest (ROI):
roi        = false( 1, size(Y,2) );
roi(41:55) = true;


%(1) Conduct SPM analysis:
spmlist   = spm1d.stats.anova2nested(Y, A, B, 'roi', roi);
spmilist  = spmlist.inference(0.05);


%(2) Plot: 
close all
spmilist.plot('plot_threshold_label',true, 'plot_p_values',true, 'autoset_ylim',true);

    









