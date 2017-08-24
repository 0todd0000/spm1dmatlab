function [SPM] = regress(y, x)
% D'Agostino-Pearson K2 test on residuals from simple linear regression
% (test statistic computation only)
% 
% FORMATS
% [spm] = spm1d.stats.normality.regress(y, x)
%
% yA    - (J x Q) data array
%         J - number of responses
%         Q - number of continuum nodes
% x     - (J x 1) array {independent variable}
%
% spm   - statistical parametric map object
%__________________________________________________________________________
% Copyright (C) 2017 Todd Pataky


spm = spm1d.stats.regress(y, x);
SPM = spm1d.stats.normality.k2residuals( spm.residuals );
