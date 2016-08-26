%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM0D.m 1 2016-01-04 16:07 todd $


classdef CITwoSample1D < spm1d.stats.ci.CITwoSample & spm1d.stats.ci.CI1D
    methods
        function [self]  = CITwoSample1D(spmi, mA, mB, hstar, mu)
            self@spm1d.stats.ci.CITwoSample(spmi, mA, mB, hstar, mu)
            self@spm1d.stats.ci.CI1D(spmi)
        end
        
        function plot(self)
            self.plot_multimean()
        end
        
    end
end

