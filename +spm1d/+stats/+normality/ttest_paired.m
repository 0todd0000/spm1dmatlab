function [SPM] = ttest_paired(YA, YB)
% D'Agostino-Pearson K2 test on residuals from a paired t test
% (test statistic computation only)
% 
% FORMATS
% [spm] = spm1d.stats.normality.ttest_paired(yA, yB)
%
% yA    - (J x Q) data array
%         J - number of responses
%         Q - number of continuum nodes
% yB    - (J x Q) data array
%
% spm   - statistical parametric map object
%__________________________________________________________________________
% Copyright (C) 2017 Todd Pataky


SPM           = spm1d.stats.normality.ttest( YA - YB );