function [spmi] = snpmi2spmi(snpmi)

spmi        = snpmi;
spmi.zstar  = max(snpmi.zstar);
spmi.df     = nan;
spmi.fwhm   = nan;
spmi.resels = nan;
