function [SPM] = anova2onerm(Y, A, B, SUBJ, varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: anova2onerm.m 1 2016-01-04 16:07 todd $

design = spm1d.stats.anova.designs.ANOVA2onerm(A, B, SUBJ);
model  = spm1d.stats.anova.LinearModel(Y, design.X, varargin{:});
if (model.dim==1) && ( design.check_for_single_responses() )
    model  = model.fit(  design.contrasts.C(1:5,:)  );
else
    model  = model.fit();
end
SPM    = model.aov(design.contrasts, design.f_terms);
SPM    = spm1d.stats.spm.SPMList(SPM);


