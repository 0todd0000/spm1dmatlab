function [SPM] = anova2(y, A, B)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: ttest.m 1 2016-01-04 16:07 todd $

spm   = spm1d.stats.anova2(y, A, B);
SPM   = spm1d.stats.normality.k2residuals( spm.residuals );