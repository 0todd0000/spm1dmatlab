function [SPM] = ttest(Y, varargin)
%__________________________________________________________________________
% Copyright (C) Copyright (C) 2026  Todd Pataky Todd Pataky


Y             = spm1d.util.flatten(Y);
spm1d.util.check_zero_var(Y);
x             = Y - ones(size(Y)) * diag( mean(Y, 1) );
SPM           = spm1d.stats.normality.k2residuals(x);