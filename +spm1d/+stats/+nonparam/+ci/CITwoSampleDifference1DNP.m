%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM0D.m 1 2016-01-04 16:07 todd $


classdef CITwoSampleDifference1DNP <  spm1d.stats.ci.CITwoSampleDifference1D
    methods
        function [self] = CITwoSampleDifference1DNP(snpmi, mn, hstar, mu)
            self @ spm1d.stats.ci.CITwoSampleDifference1D(snpmi, mn, hstar, mu)
            self.name = '1D Non-Parametric Confidence Interval';
            self.isparametric  = false;
        end
    end
end