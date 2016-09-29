%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef CIOneSample0DNP <  spm1d.stats.ci.CIOneSample0D
    methods
        function [self] = CIOneSample0DNP(snpmi, mn, hstar, mu)
            self @ spm1d.stats.ci.CIOneSample0D(snpmi, mn, hstar, mu)
            self.name = '0D Non-Parametric Confidence Interval';
            self.isparametric  = false;
        end
    end
end