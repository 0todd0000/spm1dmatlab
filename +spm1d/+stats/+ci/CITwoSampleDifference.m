%__________________________________________________________________________
% Copyright (C) Copyright (C) 2026  Todd Pataky Todd Pataky



classdef CITwoSampleDifference < spm1d.stats.ci.CIDifference
    methods
        function [self] = CITwoSampleDifference(spmi, mn, hstar, mu)
            self@spm1d.stats.ci.CIDifference(spmi, mn, hstar, mu)
            self.kind            = 'Two-sample difference';
        end
    end
end

