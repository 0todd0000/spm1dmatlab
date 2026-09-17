%__________________________________________________________________________
% Copyright (C) Copyright (C) 2026  Todd Pataky Todd Pataky



classdef CIOneSample0DNP <  spm1d.stats.ci.CIOneSample0D
    methods
        function [self] = CIOneSample0DNP(snpmi, mn, hstar, mu)
            self @ spm1d.stats.ci.CIOneSample0D(snpmi, mn, hstar, mu)
            self.name = '0D Non-Parametric Confidence Interval';
            self.isparametric  = false;
        end
    end
end