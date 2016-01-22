function [SPM] = ttest_paired(yA, yB, varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: ttest_paired.m 1 2016-01-04 16:07 todd $

[yA,yB] = deal(spm1d.util.flatten(yA), spm1d.util.flatten(yB));
SPM = spm1d.stats.ttest(yA-yB, varargin{:});
