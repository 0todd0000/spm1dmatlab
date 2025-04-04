function [SnPM] = hotellings2(yA, yB, varargin)
%__________________________________________________________________________
% Copyright (C) 2022 Todd Pataky


roi_found = any(   cellfun(@(c)(isequal(lower(c),'roi')), varargin(1:end:2))   );
if roi_found
    error('[spm1d error]  "roi" analysis is not supported for nonparametric procedures.')
end


[yA,yB] = deal( spm1d.util.flatten(yA), spm1d.util.flatten(yB) );
if ndims(yA)==2 %#ok<ISMAT>
    perm  = spm1d.stats.nonparam.permuters.PermuterHotellings2_0D(yA, yB);
else
    perm  = spm1d.stats.nonparam.permuters.PermuterHotellings2_1D(yA, yB);
end
SnPM  = spm1d.stats.nonparam.snpm.build_snpm('T2', perm);


