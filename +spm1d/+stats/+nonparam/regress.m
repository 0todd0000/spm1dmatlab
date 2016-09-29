function [SnPM] = regress(y, x)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky


[y,x] = deal( spm1d.util.flatten(y), spm1d.util.flatten(x));
if isvector(y)
    perm  = spm1d.stats.nonparam.permuters.PermuterRegress_0D(y, x);
else
    perm  = spm1d.stats.nonparam.permuters.PermuterRegress_1D(y, x);
end
SnPM  = spm1d.stats.nonparam.snpm.build_snpm('T', perm);

