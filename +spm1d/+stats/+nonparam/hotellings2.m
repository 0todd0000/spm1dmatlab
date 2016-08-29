function [SnPM] = hotellings2(yA, yB, varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: ttest.m 1 2016-01-04 16:07 todd $

perm    = spm1d.stats.nonparam.permuters.PermuterHotellings2_0D(yA, yB);
SnPM    = spm1d.stats.nonparam.snpm.build_snpm('T2', perm);

