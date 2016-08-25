function [SPM] = anova1(y, A)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: ttest.m 1 2016-01-04 16:07 todd $

spm   = spm1d.stats.anova1(y, A);
SPM   = spm1d.stats.normality.k2residuals( spm.residuals );