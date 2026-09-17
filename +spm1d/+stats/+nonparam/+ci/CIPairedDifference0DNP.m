%__________________________________________________________________________
% Copyright (C) Copyright (C) 2026  Todd Pataky Todd Pataky



classdef CIPairedDifference0DNP <  spm1d.stats.ci.CIPairedDifference0D
    methods
        function [self] = CIPairedDifference0DNP(snpmi, mn, hstar, mu)
            self @ spm1d.stats.ci.CIPairedDifference0D(snpmi, mn, hstar, mu)
            self.name = '0D Non-Parametric Confidence Interval';
            self.isparametric  = false;
        end
    end
end