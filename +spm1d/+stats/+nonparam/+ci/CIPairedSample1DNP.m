%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM0D.m 1 2016-01-04 16:07 todd $


classdef CIPairedSample1DNP <  spm1d.stats.ci.CIPairedSample1D
    methods
        function [self] = CIPairedSample1DNP(snpmi, mA, mB, hstar, mu)
            self @ spm1d.stats.ci.CIPairedSample1D(snpmi, mA, mB, hstar, mu)
            self.name = '1D Non-Parametric Confidence Interval';
            self.isparametric  = false;
        end
    end
end