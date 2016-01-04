function [SPM] = anova1(Y, A, varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: anova1.m 1 2016-01-04 16:07 todd $

design = spm1d.stats.anova.designs.ANOVA1(A);
model  = spm1d.stats.anova.LinearModel(Y, design.X, varargin{:});
model  = model.fit();
SPM    = model.aov(design.contrasts, design.f_terms);
SPM    = SPM{1};



