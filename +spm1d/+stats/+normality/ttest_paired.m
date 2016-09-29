function [SPM] = ttest_paired(YA, YB)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky


SPM           = spm1d.stats.normality.ttest( YA - YB );