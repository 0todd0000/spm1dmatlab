function [SPM] = ttest2(yA, yB, varargin)

% Copyright (C) 2014  Todd Pataky
% Version: M0.1 (2014/05/01)

[nA,nB]       = deal(size(yA,1), size(yB,1));
Y             = [yA; yB];
% specify design and contrast:
X             = zeros(nA+nB, 2);
X(1:nA,1)     = 1;
X(nA+1:end,2) = 1;
c             = [1 -1]';
% compute SPM{t}:
[SPM]         = spm1d.stats.glm(Y, X, c, varargin{:});
