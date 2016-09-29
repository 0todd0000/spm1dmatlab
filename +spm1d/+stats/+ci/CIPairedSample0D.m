%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef CIPairedSample0D < spm1d.stats.ci.CIPairedSample & spm1d.stats.ci.CI0D
    methods
        function [self]  = CIPairedSample0D(spmi, mA, mB, hstar, mu)
            self@spm1d.stats.ci.CIPairedSample(spmi, mA, mB, hstar, mu)
            self@spm1d.stats.ci.CI0D(spmi)
        end
        function plot(self)
            self.plot_multimean()
        end
    end
end

