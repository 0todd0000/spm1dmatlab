function [SnPM] = hotellings2(yA, yB, varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky




[yA,yB] = deal( spm1d.util.flatten(yA), spm1d.util.flatten(yB) );
if ndims(yA)==2 %#ok<ISMAT>
    perm  = spm1d.stats.nonparam.permuters.PermuterHotellings2_0D(yA, yB);
else
    perm  = spm1d.stats.nonparam.permuters.PermuterHotellings2_1D(yA, yB);
end
SnPM  = spm1d.stats.nonparam.snpm.build_snpm('T2', perm);


