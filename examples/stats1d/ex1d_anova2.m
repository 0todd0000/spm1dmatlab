    

clear;  clc

%%% ANALYSES FOR THESE EXAMPLES ARE NOT YET IMPLEMENTED %%%
% dataset    = spm1d.data.uv1d.anova2.Besier2009kneeflexion();
% dataset    = spm1d.data.uv1d.anova2.Dorn2012();
%%% The datasets are unbalanced %%%
%%% Analyses of unbalanced data will be available in a future release of spm1d %%%



%(0) Load data:
% dataset    = spm1d.data.uv1d.anova2.SPM1D_ANOVA2_2x2();
dataset    = spm1d.data.uv1d.anova2.SPM1D_ANOVA2_2x3();
% dataset    = spm1d.data.uv1d.anova2.SPM1D_ANOVA2_3x3();
% dataset    = spm1d.data.uv1d.anova2.SPM1D_ANOVA2_3x4();
% dataset    = spm1d.data.uv1d.anova2.SPM1D_ANOVA2_3x5();
% dataset    = spm1d.data.uv1d.anova2.SPM1D_ANOVA2_4x4();
% dataset    = spm1d.data.uv1d.anova2.SPM1D_ANOVA2_4x5();
[Y,A,B] = deal(dataset.Y, dataset.A, dataset.B);



%(1) Conduct SPM analysis:
%%% THIS WILL PRODUCE AN ERROR IF THE DESIGN IS UNBALANCED
spmlist   = spm1d.stats.anova2(Y, A, B);
spmilist  = spmlist.inference(0.05);
disp_summ(spmilist)


%(2) Plot:
close all
spmilist.plot('plot_threshold_label',true, 'plot_p_values',true, 'autoset_ylim',true);

%MANUALLY construct the same plot:
% for k = 1:spmilist.nEffects
%     subplot(2,2,k)
%     spmi = spmilist(k);
%     spmi.plot();
%     title( spmi.effect )
% end


