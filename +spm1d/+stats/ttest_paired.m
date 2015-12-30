function [SPM] = ttest_paired(yA, yB, varargin)

% Copyright (C) 2014  Todd Pataky
% Version: M0.1 (2014/05/01)

SPM = spm1d.stats.ttest(yA-yB, varargin{:});
