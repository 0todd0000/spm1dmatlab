function [SPM] = anova1rm(Y, A, SUBJ)

design = spm1d.stats.anova.designs.ANOVA1rm(A, SUBJ);
model  = spm1d.stats.anova.LinearModel(Y, design.X);
model  = model.fit();
SPM    = model.aov(design.contrasts, design.f_terms);
SPM    = SPM{1};



