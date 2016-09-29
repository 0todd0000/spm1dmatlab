function [SPM] = anova3rm(Y, A, B, C, SUBJ, varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky


parser         = spm1d.stats.anova.parseargs(varargin{:});
force_approx0D = parser.Results.force_approx0D;


design = spm1d.stats.anova.designs.ANOVA3rm(A, B, C, SUBJ);
model  = spm1d.stats.anova.LinearModel(Y, design.X, varargin{:});
if (model.dim==1 || force_approx0D) && ( design.check_for_single_responses(model.dim) )
    model  = model.fit(  design.contrasts.C(1:8,:)  );
else
    model  = model.fit();
end
SPM    = model.aov(design.contrasts, design.f_terms);
SPM    = spm1d.stats.spm.SPMFList(SPM);
SPM    = spm1d.stats.anova.set_labels(SPM, design);

