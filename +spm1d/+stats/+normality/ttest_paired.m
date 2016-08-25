function [SPM] = ttest_paired(YA, YB)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: ttest.m 1 2016-01-04 16:07 todd $

SPM           = spm1d.stats.normality.ttest( YA - YB );