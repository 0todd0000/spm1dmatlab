function [SPM] = ttest_paired(YA, YB)
%__________________________________________________________________________
% Copyright (C) 2022 Todd Pataky

spm1d.util.check_zero_var(YA);
spm1d.util.check_zero_var(YB);
SPM           = spm1d.stats.normality.ttest( YA - YB );