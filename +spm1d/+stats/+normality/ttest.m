function [SPM] = ttest(Y, varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky


Y             = spm1d.util.flatten(Y);
x             = Y - ones(size(Y)) * diag( mean(Y, 1) );
SPM           = spm1d.stats.normality.k2residuals(x);