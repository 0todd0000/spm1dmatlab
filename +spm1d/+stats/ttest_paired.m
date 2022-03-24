function [SPM] = ttest_paired(yA, yB, varargin)
%__________________________________________________________________________
% Copyright (C) 2022 Todd Pataky


[yA,yB] = deal(spm1d.util.flatten(yA), spm1d.util.flatten(yB));
spm1d.util.check_zero_var(yA);
SPM = spm1d.stats.ttest(yA-yB, varargin{:});
