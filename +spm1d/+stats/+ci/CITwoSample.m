%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM0D.m 1 2016-01-04 16:07 todd $


classdef CITwoSample < spm1d.stats.ci.CIMultiMean
    methods
        function [self]  = CITwoSample(spmi, mA, mB, hstar, mu)
            self@spm1d.stats.ci.CIMultiMean(spmi, mA, mB, hstar, mu)
            self.kind    = 'Two sample';
        end
    end
    
end

