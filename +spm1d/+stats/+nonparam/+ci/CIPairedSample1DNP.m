%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef CIPairedSample1DNP <  spm1d.stats.ci.CIPairedSample1D
    methods
        function [self] = CIPairedSample1DNP(snpmi, mA, mB, hstar, mu)
            self @ spm1d.stats.ci.CIPairedSample1D(snpmi, mA, mB, hstar, mu)
            self.name = '1D Non-Parametric Confidence Interval';
            self.isparametric  = false;
        end
    end
end