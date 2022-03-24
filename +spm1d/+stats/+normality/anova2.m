function [SPM] = anova2(y, A, B)
%__________________________________________________________________________
% Copyright (C) 2022 Todd Pataky


spm   = spm1d.stats.anova2(y, A, B);
SPM   = spm1d.stats.normality.k2residuals( spm.residuals );