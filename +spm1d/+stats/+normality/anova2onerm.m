function [SPM] = anova2onerm(y, A, B, SUBJ)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky


spm   = spm1d.stats.anova2onerm(y, A, B, SUBJ, 'force_approx0D', true);
SPM   = spm1d.stats.normality.k2residuals( spm.residuals );