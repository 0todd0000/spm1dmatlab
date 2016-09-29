%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef CIPairedSample < spm1d.stats.ci.CIMultiMean
    methods
        function [self]  = CIPairedSample(spmi, mA, mB, hstar, mu)
            self@spm1d.stats.ci.CIMultiMean(spmi, mA, mB, hstar, mu)
            self.kind    = 'Paired sample';
        end
    end
    
end

