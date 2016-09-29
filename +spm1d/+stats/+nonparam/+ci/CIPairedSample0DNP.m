%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef CIPairedSample0DNP <  spm1d.stats.ci.CIPairedSample0D
    methods
        function [self] = CIPairedSample0DNP(snpmi, mA, mB, hstar, mu)
            self @ spm1d.stats.ci.CIPairedSample0D(snpmi, mA, mB, hstar, mu)
            self.name = '0D Non-Parametric Confidence Interval';
            self.isparametric  = false;
        end
    end
end