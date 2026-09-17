%__________________________________________________________________________
% Copyright (C) Copyright (C) 2026  Todd Pataky Todd Pataky



classdef CITwoSample0D < spm1d.stats.ci.CITwoSample & spm1d.stats.ci.CI0D
    methods
        function [self]  = CITwoSample0D(spmi, mA, mB, hstar, mu)
            self@spm1d.stats.ci.CITwoSample(spmi, mA, mB, hstar, mu)
            self@spm1d.stats.ci.CI0D(spmi)
        end
        
        function plot(self)
            self.plot_multimean()
        end
        
    end
end

