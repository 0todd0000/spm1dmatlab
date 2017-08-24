function [SPM] = ttest2(yA, yB, varargin)
% Two-sample t test (test statistic computation only)
% 
% FORMATS
% [spm] = spm1d.stats.ttest2(yA, yB)
% [spm] = spm1d.stats.ttest2(yA, yB, roi)
% [spm] = spm1d.stats.ttest2(yA, yB, 'roi', roi)
%
% yA    - (JA x Q) data array
%         JA - number of Group A responses
%         Q - number of continuum nodes
% yB    - (JB x Q) data array
%         JB - number of Group B responses
% roi   - (1 x Q) region of interest {1D data only}
%
% spm   - statistical parametric map object
%__________________________________________________________________________
% Copyright (C) 2017 Todd Pataky


[yA,yB]       = deal(spm1d.util.flatten(yA), spm1d.util.flatten(yB));
[nA,nB]       = deal(size(yA,1), size(yB,1));
Y             = [yA; yB];
% specify design and contrast:
X             = zeros(nA+nB, 2);
X(1:nA,1)     = 1;
X(nA+1:end,2) = 1;
c             = [1 -1]';
% compute SPM{t}:
[SPM]         = spm1d.stats.glm(Y, X, c, varargin{:});
