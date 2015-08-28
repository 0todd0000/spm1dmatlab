function [SPM] = anova1(Y, A)

design = spm1d.stats.anova.designs.ANOVA1(A);
model  = spm1d.stats.anova.LinearModel(Y, design.X);
model  = model.fit();
SPM    = model.aov(design.contrasts, design.f_terms);
SPM    = SPM{1};



