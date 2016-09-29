function [SPM] = anova1rm(y, A, SUBJ)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky


spm   = spm1d.stats.anova1rm(y, A, SUBJ, 'force_approx0D', true);
SPM   = spm1d.stats.normality.k2residuals( spm.residuals );