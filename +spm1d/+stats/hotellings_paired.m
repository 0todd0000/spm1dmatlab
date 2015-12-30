function [SPM] = hotellings_paired(YA, YB, varargin)

SPM = spm1d.stats.hotellings(YB-YA);


