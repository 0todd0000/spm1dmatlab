function [SPM] = anova1(y, A)
%__________________________________________________________________________
% Copyright (C) Copyright (C) 2026  Todd Pataky Todd Pataky


spm   = spm1d.stats.anova1(y, A);
SPM   = spm1d.stats.normality.k2residuals( spm.residuals );