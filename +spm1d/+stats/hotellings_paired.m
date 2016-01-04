function [SPM] = hotellings_paired(YA, YB, varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: hotellings_paired.m 1 2016-01-04 16:07 todd $


SPM = spm1d.stats.hotellings(YB-YA, varargin{:});


