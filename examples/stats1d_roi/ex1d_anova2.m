    

clear;  clc

%%% ANALYSES FOR THESE EXAMPLES ARE NOT YET IMPLEMENTED %%%
% dataset    = spm1d.data.uv1d.anova2.Besier2009kneeflexion();
% dataset    = spm1d.data.uv1d.anova2.Dorn2012();
%%% The datasets are unbalanced %%%
%%% Analyses of unbalanced data will be available in a future release of spm1d %%%



%(0) Load data:
dataset    = spm1d.data.uv1d.anova2.SPM1D_ANOVA2_2x2();
[Y,A,B] = deal(dataset.Y, dataset.A, dataset.B);


%(0a) Create region(s) of interest (ROI):
roi        = false( 1, size(Y,2) );
roi(61:80) = true;


%(1) Conduct SPM analysis:
%%% THIS WILL PRODUCE AN ERROR IF THE DESIGN IS UNBALANCED
spmlist   = spm1d.stats.anova2(Y, A, B, 'roi', roi);
spmilist  = spmlist.inference(0.05);


%(2) Plot: 
close all
spmilist.plot('plot_threshold_label',true, 'plot_p_values',true, 'autoset_ylim',true);

    









