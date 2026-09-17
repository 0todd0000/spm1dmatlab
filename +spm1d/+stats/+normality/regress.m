function [SPM] = regress(y, x)
%__________________________________________________________________________
% Copyright (C) Copyright (C) 2026  Todd Pataky Todd Pataky


spm = spm1d.stats.regress(y, x);
SPM = spm1d.stats.normality.k2residuals( spm.residuals );
