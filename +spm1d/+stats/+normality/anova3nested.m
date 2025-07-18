function [SPM] = anova3nested(y, A, B, C)
%__________________________________________________________________________
% Copyright (C) 2025 Todd Pataky


spm   = spm1d.stats.anova3nested(y, A, B, C);
SPM   = spm1d.stats.normality.k2residuals( spm.residuals );