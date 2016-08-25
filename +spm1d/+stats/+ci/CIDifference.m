%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM0D.m 1 2016-01-04 16:07 todd $


classdef CIDifference < spm1d.stats.ci.CISingleMean
    methods
        function [self] = CIDifference(spmi, mn, hstar, mu)
            self@spm1d.stats.ci.CISingleMean(spmi, mn, hstar, mu)
            self.kind            = 'Difference';
        end
    end
end

