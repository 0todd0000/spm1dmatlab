function [SPM] = ttest_paired(yA, yB, varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky


[yA,yB] = deal(spm1d.util.flatten(yA), spm1d.util.flatten(yB));
SPM = spm1d.stats.ttest(yA-yB, varargin{:});
