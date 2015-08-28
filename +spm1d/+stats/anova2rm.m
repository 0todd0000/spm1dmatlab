function [SPM] = anova2rm(Y, A, B, SUBJ)

design = spm1d.stats.anova.designs.ANOVA2rm(A, B, SUBJ);
model  = spm1d.stats.anova.LinearModel(Y, design.X);
if (model.dim==1) && ( design.check_for_single_responses() )
    model  = model.fit(  design.contrasts.C(1:5,:)  );
else
    model  = model.fit();
end
SPM    = model.aov(design.contrasts, design.f_terms);
SPM    = spm1d.stats.spm.SPMList(SPM);

