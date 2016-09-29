%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef CITwoSampleDifference0DNP <  spm1d.stats.ci.CITwoSampleDifference0D
    methods
        function [self] = CITwoSampleDifference0DNP(snpmi, mn, hstar, mu)
            self @ spm1d.stats.ci.CITwoSampleDifference0D(snpmi, mn, hstar, mu)
            self.name = '0D Non-Parametric Confidence Interval';
            self.isparametric  = false;
        end
    end
end