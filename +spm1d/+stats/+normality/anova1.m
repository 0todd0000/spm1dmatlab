function [SPM] = anova1(y, A)
%__________________________________________________________________________
% Copyright (C) 2022 Todd Pataky


spm   = spm1d.stats.anova1(y, A);
SPM   = spm1d.stats.normality.k2residuals( spm.residuals );