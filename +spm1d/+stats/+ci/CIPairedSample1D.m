%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM0D.m 1 2016-01-04 16:07 todd $


classdef CIPairedSample1D < spm1d.stats.ci.CIPairedSample & spm1d.stats.ci.CI1D
    methods
        function [self]  = CIPairedSample1D(spmi, mA, mB, hstar, mu)
            self@spm1d.stats.ci.CI1D(spmi)
            self@spm1d.stats.ci.CIPairedSample(spmi, mA, mB, hstar, mu)
        end
        function plot(self)
            self.plot_multimean()
        end
    end
end

