%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM0D.m 1 2016-01-04 16:07 todd $


classdef CIOneSample0DNP <  spm1d.stats.ci.CIOneSample0D
    methods
        function [self] = CIOneSample0DNP(snpmi, mn, hstar, mu)
            self @ spm1d.stats.ci.CIOneSample0D(snpmi, mn, hstar, mu)
            self.name = '0D Non-Parametric Confidence Interval';
            self.isparametric  = false;
        end
    end
end