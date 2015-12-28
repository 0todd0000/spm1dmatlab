function [SPM] = ttest(Y, varargin)

% Copyright (C) 2015  Todd Pataky
% Version: M0.1 (2015/12/28)

[J,~]         = size(Y);
X             = ones(J, 1);
c             = 1;
[SPM]         = spm1d.stats.glm(Y, X, c, varargin{:});