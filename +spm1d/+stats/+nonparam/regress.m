function [SnPM] = regress(y, x)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: ttest.m 1 2016-01-04 16:07 todd $

[y,x] = deal( spm1d.util.flatten(y), spm1d.util.flatten(x));
perm  = spm1d.stats.nonparam.permuters.PermuterRegress_0D(y, x);
SnPM  = spm1d.stats.nonparam.snpm.build_snpm('T', perm);

