    

clear;  clc


%(0) Load data:
dataset    = spm1d.data.uv1d.anova2onerm.SPM1D_ANOVA2ONERM_2x3();
[Y,A,B,SUBJ] = deal(dataset.Y, dataset.A, dataset.B, dataset.SUBJ);


%(0a) Create region(s) of interest (ROI):
roi        = false( 1, size(Y,2) );
roi(61:end) = true;


%(1) Conduct SPM analysis:
spmlist   = spm1d.stats.anova2onerm(Y, A, B, SUBJ, 'roi', roi);
spmilist  = spmlist.inference(0.05);


%(2) Plot: 
close all
spmilist.plot('plot_threshold_label',true, 'plot_p_values',true, 'autoset_ylim',true);

    

