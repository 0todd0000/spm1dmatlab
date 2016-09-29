function [SPM] = hotellings_paired(YA, YB, varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



SPM = spm1d.stats.hotellings(YB-YA, varargin{:});


