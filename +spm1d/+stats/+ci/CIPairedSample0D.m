%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM0D.m 1 2016-01-04 16:07 todd $


classdef CIPairedSample0D < spm1d.stats.ci.CIPairedSample & spm1d.stats.ci.CI0D
    methods
        function [self]  = CIPairedSample0D(spmi, mA, mB, hstar, mu)
            self@spm1d.stats.ci.CIPairedSample(spmi, mA, mB, hstar, mu)
            self@spm1d.stats.ci.CI0D(spmi)
        end
    end
end

