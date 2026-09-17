function [SPM] = ttest_paired(yA, yB, varargin)
%__________________________________________________________________________
% Copyright (C) Copyright (C) 2026  Todd Pataky Todd Pataky


[yA,yB] = deal(spm1d.util.flatten(yA), spm1d.util.flatten(yB));
spm1d.util.check_zero_var(yA);
SPM = spm1d.stats.ttest(yA-yB, varargin{:});
