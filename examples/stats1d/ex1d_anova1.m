    

clear;  clc


%(0) Load data:
dataset  = spm1d.data.uv1d.anova1.SpeedGRFcategorical();
dataset  = spm1d.data.uv1d.anova1.Weather();
[Y,A]    = deal(dataset.Y, dataset.A);


design = spm1d.stats.anova.designs.ANOVA1(A);
model  = spm1d.stats.anova.LinearModel(Y, design.X);
model  = model.fit();
SPM    = model.aov(design.contrasts, design.f_terms);
SPM    = SPM{1};




%(1) Conduct SPM analysis:
spm       = spm1d.stats.anova1(Y, A);
spmi      = spm.inference(0.05);




%(2) Plot:
close all
spmi.plot()
spmi.plot_threshold_label();
spmi.plot_p_values();

















