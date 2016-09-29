%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef CITwoSampleDifference1DNP <  spm1d.stats.ci.CITwoSampleDifference1D
    methods
        function [self] = CITwoSampleDifference1DNP(snpmi, mn, hstar, mu)
            self @ spm1d.stats.ci.CITwoSampleDifference1D(snpmi, mn, hstar, mu)
            self.name = '1D Non-Parametric Confidence Interval';
            self.isparametric  = false;
        end
    end
end