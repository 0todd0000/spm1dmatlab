function [SPM] = anova2nested(y, A, B)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky


spm   = spm1d.stats.anova2nested(y, A, B);
SPM   = spm1d.stats.normality.k2residuals( spm.residuals );