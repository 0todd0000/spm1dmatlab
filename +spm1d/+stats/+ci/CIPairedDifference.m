%__________________________________________________________________________
% Copyright (C) Copyright (C) 2026  Todd Pataky Todd Pataky



classdef CIPairedDifference < spm1d.stats.ci.CIDifference
    methods
        function [self] = CIPairedDifference(spmi, mn, hstar, mu)
            self@spm1d.stats.ci.CIDifference(spmi, mn, hstar, mu)
            self.kind            = 'Paired difference';
        end
    end
end

