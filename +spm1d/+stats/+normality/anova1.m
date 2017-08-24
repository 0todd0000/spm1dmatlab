function [SPM] = anova1(y, A)
% D'Agostino-Pearson K2 test on residuals from one-way ANOVA
% (test statistic computation only)
% 
% FORMATS
% [spm] = spm1d.stats.normality.anova1(y, A)
%
% y     - (J x Q) data array
%         J - number of responses
%         Q - number of continuum nodes
% A     - (J x 1) array of group labels {integers}
%
% spm   - statistical parametric map object
%__________________________________________________________________________
% Copyright (C) 2017 Todd Pataky


spm   = spm1d.stats.anova1(y, A);
SPM   = spm1d.stats.normality.k2residuals( spm.residuals );