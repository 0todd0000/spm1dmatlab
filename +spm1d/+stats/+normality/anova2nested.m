function [SPM] = anova2nested(y, A, B)
% D'Agostino-Pearson K2 test on residuals from nested two-way ANOVA
% (test statistic computation only)
% 
% FORMATS
% [spm] = spm1d.stats.normality.anova2nested(y, A, B)
%
% y     - (J x Q) data array
%         J - number of responses
%         Q - number of continuum nodes
% A     - (J x 1) array of Factor A labels {integers}
% B     - (J x 1) array of Factor B labels {integers}
%
% spm   - statistical parametric map object
%__________________________________________________________________________
% Copyright (C) 2017 Todd Pataky


spm   = spm1d.stats.anova2nested(y, A, B);
SPM   = spm1d.stats.normality.k2residuals( spm.residuals );