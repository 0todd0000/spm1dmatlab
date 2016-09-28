%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM0D.m 1 2016-01-04 16:07 todd $


classdef CITwoSample1DNP <  spm1d.stats.ci.CITwoSample1D
    methods
        function [self] = CITwoSample1DNP(snpmi, mA, mB, hstar, mu)
            self @ spm1d.stats.ci.CITwoSample1D(snpmi, mA, mB, hstar, mu)
            self.name = '1D Non-Parametric Confidence Interval';
            self.isparametric  = false;
        end
    end
end