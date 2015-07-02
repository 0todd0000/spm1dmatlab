function [SPM] = ttest(Y)

% Copyright (C) 2014  Todd Pataky
% Version: M0.1 (2014/05/01)

[J,~]         = size(Y);
X             = ones(J, 1);
c             = 1;
[SPM]         = spm1d.stats.glm(Y, X, c);