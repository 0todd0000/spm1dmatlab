function [SPM] = anova3(y, A, B, C)
%__________________________________________________________________________
% Copyright (C) 2022 Todd Pataky


spm   = spm1d.stats.anova3(y, A, B, C);
SPM   = spm1d.stats.normality.k2residuals( spm.residuals );