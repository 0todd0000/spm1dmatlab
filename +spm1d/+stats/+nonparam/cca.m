function [SnPM] = cca(y, x)
%__________________________________________________________________________
% Copyright (C) 2022 Todd Pataky


spm1d.util.check_zero_var(y);
x     = spm1d.util.flatten(x);
if ndims(y)==2 %#ok<ISMAT>
    perm  = spm1d.stats.nonparam.permuters.PermuterCCA_0D(y, x);
else
    perm  = spm1d.stats.nonparam.permuters.PermuterCCA_1D(y, x);
end
SnPM  = spm1d.stats.nonparam.snpm.build_snpm('X2', perm);


