function [SnPM] = hotellings_paired(yA, yB, varargin)
%__________________________________________________________________________
% Copyright (C) 2022 Todd Pataky


SnPM  = spm1d.stats.nonparam.hotellings(yA - yB);

