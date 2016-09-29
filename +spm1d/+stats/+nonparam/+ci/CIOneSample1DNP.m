%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef CIOneSample1DNP <  spm1d.stats.ci.CIOneSample1D
    methods
        function [self] = CIOneSample1DNP(snpmi, mn, hstar, mu)
            self @ spm1d.stats.ci.CIOneSample1D(snpmi, mn, hstar, mu)
            self.name = '1D Non-Parametric Confidence Interval';
            self.isparametric  = false;
        end
    end
end