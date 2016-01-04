function [rCounts] = resels(R, W)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: resels.m 1 2016-01-04 16:07 todd $

if ndims(R)==3
    a         = any( squeeze(any(abs(R)>0, 1)), 2)';
else
    a         = any(abs(R)>0, 1);
end
nNodes        = sum(a);
[~,nClusters] = spm1d.geom.bwlabel(a);
rCounts       = [nClusters (nNodes-nClusters)/W];



