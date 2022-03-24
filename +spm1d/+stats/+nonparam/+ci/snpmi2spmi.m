function [spmi] = snpmi2spmi(snpmi)
% Copyright (C) 2022 Todd Pataky

spmi        = snpmi;
spmi.zstar  = max(snpmi.zstar);
spmi.df     = nan;
spmi.fwhm   = nan;
spmi.resels = nan;
