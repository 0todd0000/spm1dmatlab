function [SPM] = anova3tworm(y, A, B, C, SUBJ)
% D'Agostino-Pearson K2 test on residuals from three-way ANOVA with two
% repeated-measures factors (test statistic computation only)
% 
% FORMATS
% [spm] = spm1d.stats.normality.anova3tworm(y, A, B, C, SUBJ)
%
% y     - (J x Q) data array
%         J - number of responses
%         Q - number of continuum nodes
% A     - (J x 1) array of Factor A labels {integers}
% B     - (J x 1) array of Factor B labels {integers}
% C     - (J x 1) array of Factor C labels {integers}
% SUBJ  - (J x 1) array of subject labels {integers}
%
% spm   - statistical parametric map object
%__________________________________________________________________________
% Copyright (C) 2017 Todd Pataky



spm   = spm1d.stats.anova3tworm(y, A, B, C, SUBJ, 'force_approx0D', true);
SPM   = spm1d.stats.normality.k2residuals( spm.residuals );