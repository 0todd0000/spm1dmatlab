function [SPM] = anova2(Y, A, B, varargin)
%__________________________________________________________________________
% Copyright (C) 2025 Todd Pataky


design = spm1d.stats.anova.designs.ANOVA2(A, B);
model  = spm1d.stats.anova.LinearModel(Y, design.X, varargin{:});
model  = model.fit();
SPM    = model.aov(design.contrasts, design.f_terms);
SPM    = spm1d.stats.spm.SPMFList(SPM);
SPM    = spm1d.stats.anova.set_labels(SPM, design);





