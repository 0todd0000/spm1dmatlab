%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef CIPairedDifference1D < spm1d.stats.ci.CIPairedDifference & spm1d.stats.ci.CI1D
    methods
        function [self]  = CIPairedDifference1D(spmi, mn, hstar, mu)
            self@spm1d.stats.ci.CIPairedDifference(spmi, mn, hstar, mu)
            self@spm1d.stats.ci.CI1D(spmi)
        end
    end
end

