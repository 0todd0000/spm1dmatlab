function [SPM] = anova1rm(y, A, SUBJ)
% D'Agostino-Pearson K2 test on residuals from one-way repeated-measures
% ANOVA (test statistic computation only)
% 
% FORMATS
% [spm] = spm1d.stats.normality.anova1rm(y, A, SUBJ)
%
% y     - (J x Q) data array
%         J - number of responses
%         Q - number of continuum nodes
% A     - (J x 1) array of group labels {integers}
% SUBJ  - (J x 1) array of subject labels {integers}
%
% spm   - statistical parametric map object
%__________________________________________________________________________
% Copyright (C) 2017 Todd Pataky


spm   = spm1d.stats.anova1rm(y, A, SUBJ, 'force_approx0D', true);
SPM   = spm1d.stats.normality.k2residuals( spm.residuals );