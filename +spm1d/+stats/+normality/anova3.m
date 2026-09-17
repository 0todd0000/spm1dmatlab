function [SPM] = anova3(y, A, B, C)
%__________________________________________________________________________
% Copyright (C) Copyright (C) 2026  Todd Pataky Todd Pataky


spm   = spm1d.stats.anova3(y, A, B, C);
SPM   = spm1d.stats.normality.k2residuals( spm.residuals );