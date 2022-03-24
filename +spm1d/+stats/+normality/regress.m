function [SPM] = regress(y, x)
%__________________________________________________________________________
% Copyright (C) 2022 Todd Pataky


spm = spm1d.stats.regress(y, x);
SPM = spm1d.stats.normality.k2residuals( spm.residuals );
