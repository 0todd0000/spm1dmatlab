%__________________________________________________________________________
% Copyright (C) Copyright (C) 2026  Todd Pataky Todd Pataky



classdef CIPairedDifference1DNP <  spm1d.stats.ci.CIPairedDifference1D
    methods
        function [self] = CIPairedDifference1DNP(snpmi, mn, hstar, mu)
            self @ spm1d.stats.ci.CIPairedDifference1D(snpmi, mn, hstar, mu)
            self.name = '1D Non-Parametric Confidence Interval';
            self.isparametric  = false;
        end
    end
end