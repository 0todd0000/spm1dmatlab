%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef CITwoSample1DNP <  spm1d.stats.ci.CITwoSample1D
    methods
        function [self] = CITwoSample1DNP(snpmi, mA, mB, hstar, mu)
            self @ spm1d.stats.ci.CITwoSample1D(snpmi, mA, mB, hstar, mu)
            self.name = '1D Non-Parametric Confidence Interval';
            self.isparametric  = false;
        end
    end
end