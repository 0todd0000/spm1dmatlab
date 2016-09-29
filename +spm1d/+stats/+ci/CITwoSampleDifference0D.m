%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef CITwoSampleDifference0D < spm1d.stats.ci.CITwoSampleDifference & spm1d.stats.ci.CI0D
    methods
        function [self]  = CITwoSampleDifference0D(spmi, mn, hstar, mu)
            self@spm1d.stats.ci.CITwoSampleDifference(spmi, mn, hstar, mu)
            self@spm1d.stats.ci.CI0D(spmi)
        end
    end
end

