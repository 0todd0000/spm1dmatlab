%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef CIPairedDifference0D < spm1d.stats.ci.CIPairedDifference & spm1d.stats.ci.CI0D
    methods
        function [self]  = CIPairedDifference0D(spmi, mn, hstar, mu)
            self@spm1d.stats.ci.CIPairedDifference(spmi, mn, hstar, mu)
            self@spm1d.stats.ci.CI0D(spmi)
        end
    end
end

