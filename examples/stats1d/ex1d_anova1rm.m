    

clear;  clc


%(0) Load data:
dataset    = spm1d.data.uv1d.anova1rm.SpeedGRFcategoricalRM();
[Y,A,SUBJ] = deal(dataset.Y, dataset.A, dataset.SUBJ);


%(1) Conduct SPM analysis:
spm_bs    = spm1d.stats.anova1(Y, A);  %between-subjects model
spm       = spm1d.stats.anova1rm(Y, A, SUBJ);  %within-subjects model
spmi      = spm.inference(0.05);
disp(spmi)



%(2) Plot:
close all
spmi.plot();
spmi.plot_threshold_label();
spmi.plot_p_values();
hold on
plot(spm_bs.z, 'r')  %between-subjects model

















