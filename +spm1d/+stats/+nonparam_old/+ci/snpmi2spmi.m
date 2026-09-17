function [spmi] = snpmi2spmi(snpmi)
% Copyright (C) Copyright (C) 2026  Todd Pataky Todd Pataky

spmi        = snpmi;
spmi.zstar  = max(snpmi.zstar);
spmi.df     = nan;
spmi.fwhm   = nan;
spmi.resels = nan;
