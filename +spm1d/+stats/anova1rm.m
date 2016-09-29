function [SPM] = anova1rm(Y, A, SUBJ, varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



parser         = spm1d.stats.anova.parseargs(varargin{:});
force_approx0D = parser.Results.force_approx0D;


design = spm1d.stats.anova.designs.ANOVA1rm(A, SUBJ);
model  = spm1d.stats.anova.LinearModel(Y, design.X, varargin{:});
if (model.dim==1 || force_approx0D) && ( design.check_for_single_responses(model.dim) )
    model  = model.fit(  design.contrasts.C(1:3,:)  );
else
    model  = model.fit();
end
SPM    = model.aov(design.contrasts, design.f_terms);
SPM    = SPM{1};



