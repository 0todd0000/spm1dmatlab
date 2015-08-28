function [SPM] = anova3(Y, A, B, C)

design = spm1d.stats.anova.designs.ANOVA3(A, B, C);
model  = spm1d.stats.anova.LinearModel(Y, design.X);
model  = model.fit();
SPM    = model.aov(design.contrasts, design.f_terms);
SPM    = spm1d.stats.spm.SPMList(SPM);



