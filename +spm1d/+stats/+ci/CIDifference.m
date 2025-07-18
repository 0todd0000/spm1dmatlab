%__________________________________________________________________________
% Copyright (C) 2025 Todd Pataky



classdef CIDifference < spm1d.stats.ci.CISingleMean
    methods
        function [self] = CIDifference(spmi, mn, hstar, mu)
            self@spm1d.stats.ci.CISingleMean(spmi, mn, hstar, mu)
            self.kind            = 'Difference';
        end
    end
end

