%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM0D.m 1 2016-01-04 16:07 todd $


classdef CITwoSampleDifference0D < spm1d.stats.ci.CITwoSampleDifference & spm1d.stats.ci.CI0D
    methods
        function [self]  = CITwoSampleDifference0D(spmi, mn, hstar, mu)
            self@spm1d.stats.ci.CITwoSampleDifference(spmi, mn, hstar, mu)
            self@spm1d.stats.ci.CI0D(spmi)
        end
    end
end

