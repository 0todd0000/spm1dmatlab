function [SPM] = anova2(y, A, B)
%__________________________________________________________________________
% Copyright (C) Copyright (C) 2026  Todd Pataky Todd Pataky


spm   = spm1d.stats.anova2(y, A, B);
SPM   = spm1d.stats.normality.k2residuals( spm.residuals );