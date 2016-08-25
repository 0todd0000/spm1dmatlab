function [SPM] = anova3(y, A, B, C)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: ttest.m 1 2016-01-04 16:07 todd $

spm   = spm1d.stats.anova3(y, A, B, C);
SPM   = spm1d.stats.normality.k2residuals( spm.residuals );