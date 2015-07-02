function [SPM] = hotellings_paired(YA, YB)

SPM = spm1d.stats.hotellings(YB-YA);


