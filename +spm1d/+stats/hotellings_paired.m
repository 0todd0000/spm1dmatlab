function [SPM] = hotellings_paired(YA, YB, varargin)
%__________________________________________________________________________
% Copyright (C) 2022 Todd Pataky


spm1d.util.check_zero_var(YA);
spm1d.util.check_zero_var(YB);
SPM = spm1d.stats.hotellings(YB-YA, varargin{:});


