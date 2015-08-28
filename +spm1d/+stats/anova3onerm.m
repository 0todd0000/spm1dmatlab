function [SPM] = anova3onerm(Y, A, B, C, SUBJ)

design = spm1d.stats.anova.designs.ANOVA3onerm(A, B, C, SUBJ);
model  = spm1d.stats.anova.LinearModel(Y, design.X);
if (model.dim==1) && ( design.check_for_single_responses() )
    model  = model.fit(  design.contrasts.C(1:8,:)  );
else
    model  = model.fit();
end
SPM    = model.aov(design.contrasts, design.f_terms);
SPM    = spm1d.stats.spm.SPMList(SPM);



