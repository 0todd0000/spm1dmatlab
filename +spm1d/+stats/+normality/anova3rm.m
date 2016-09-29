function [SPM] = anova3rm(y, A, B, C, SUBJ)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky


spm   = spm1d.stats.anova3rm(y, A, B, C, SUBJ, 'force_approx0D', true);
SPM   = spm1d.stats.normality.k2residuals( spm.residuals );