function [SPM] = ttest(Y, varargin)
% D'Agostino-Pearson K2 test on residuals from a one-sample t test
% (test statistic computation only)
% 
% FORMATS
% [spm] = spm1d.stats.normality.ttest(y)
%
% y     - (J x Q) data array
%         J - number of responses
%         Q - number of continuum nodes
%
% spm   - statistical parametric map object
%__________________________________________________________________________
% Copyright (C) 2017 Todd Pataky


Y             = spm1d.util.flatten(Y);
x             = Y - ones(size(Y)) * diag( mean(Y, 1) );
SPM           = spm1d.stats.normality.k2residuals(x);