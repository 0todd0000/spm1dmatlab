%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef CITwoSampleDifference < spm1d.stats.ci.CIDifference
    methods
        function [self] = CITwoSampleDifference(spmi, mn, hstar, mu)
            self@spm1d.stats.ci.CIDifference(spmi, mn, hstar, mu)
            self.kind            = 'Two-sample difference';
        end
    end
end

