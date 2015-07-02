function [rCounts] = resels(R, W)

% Copyright (C) 2014  Todd Pataky
% Version: M0.1 (2014/05/01)

if ndims(R)==3
    a         = any( squeeze(any(abs(R)>0, 1)), 2)';
else
    a         = any(abs(R)>0, 1);
end
nNodes        = sum(a);
[~,nClusters] = spm1d.geom.bwlabel(a);
rCounts       = [nClusters (nNodes-nClusters)/W];



