function [SPM] = anova2rm(y, A, B, SUBJ)
% D'Agostino-Pearson K2 test on residuals from two-way repeated-measures
% ANOVA (test statistic computation only)
% 
% FORMATS
% [spm] = spm1d.stats.normality.anova2rm(y, A, B, SUBJ)
%
% y     - (J x Q) data array
%         J - number of responses
%         Q - number of continuum nodes
% A     - (J x 1) array of Factor A labels {integers}
% B     - (J x 1) array of Factor B labels {integers}
% SUBJ  - (J x 1) array of subject labels {integers}
%
% spm   - statistical parametric map object
%__________________________________________________________________________
% Copyright (C) 2017 Todd Pataky


spm   = spm1d.stats.anova2rm(y, A, B, SUBJ, 'force_approx0D', true);
SPM   = spm1d.stats.normality.k2residuals( spm.residuals );