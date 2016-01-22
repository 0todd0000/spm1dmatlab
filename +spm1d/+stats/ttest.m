function [SPM] = ttest(Y, varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: ttest.m 1 2016-01-04 16:07 todd $

Y             = spm1d.util.flatten(Y);
[J,~]         = size(Y);
X             = ones(J, 1);
c             = 1;
[SPM]         = spm1d.stats.glm(Y, X, c, varargin{:});