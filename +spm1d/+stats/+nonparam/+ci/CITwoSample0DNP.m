%__________________________________________________________________________
% Copyright (C) Copyright (C) 2026  Todd Pataky Todd Pataky



classdef CITwoSample0DNP <  spm1d.stats.ci.CITwoSample0D
    methods
        function [self] = CITwoSample0DNP(snpmi, mA, mB, hstar, mu)
            self @ spm1d.stats.ci.CITwoSample0D(snpmi, mA, mB, hstar, mu)
            self.name = '0D Non-Parametric Confidence Interval';
            self.isparametric  = false;
        end
    end
end