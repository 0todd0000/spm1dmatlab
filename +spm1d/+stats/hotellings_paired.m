function [SPM] = hotellings_paired(YA, YB, varargin)
%__________________________________________________________________________
% Copyright (C) Copyright (C) 2026  Todd Pataky Todd Pataky


spm1d.util.check_zero_var(YA);
spm1d.util.check_zero_var(YB);
SPM = spm1d.stats.hotellings(YB-YA, varargin{:});


