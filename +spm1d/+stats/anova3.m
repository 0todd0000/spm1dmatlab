function [SPM] = anova3(Y, A, B, C, varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: anova3.m 1 2016-01-04 16:07 todd $

design = spm1d.stats.anova.designs.ANOVA3(A, B, C);
model  = spm1d.stats.anova.LinearModel(Y, design.X, varargin{:});
model  = model.fit();
SPM    = model.aov(design.contrasts, design.f_terms);
SPM    = spm1d.stats.spm.SPMList(SPM);



