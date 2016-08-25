function [SPM] = anova3onerm(y, A, B, C, SUBJ)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: ttest.m 1 2016-01-04 16:07 todd $

spm   = spm1d.stats.anova3onerm(y, A, B, C, SUBJ, 'force_approx0D', true);
SPM   = spm1d.stats.normality.k2residuals( spm.residuals );