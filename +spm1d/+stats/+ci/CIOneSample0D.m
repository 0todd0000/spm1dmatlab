%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM0D.m 1 2016-01-04 16:07 todd $


classdef CIOneSample0D < spm1d.stats.ci.CISingleMean & spm1d.stats.ci.CI0D
    methods
        function [self]  = CIOneSample0D(spmi, mn, hstar, mu)
            self@spm1d.stats.ci.CI0D(spmi)
            self@spm1d.stats.ci.CISingleMean(spmi, mn, hstar, mu)
        end
    end
end

