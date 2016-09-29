%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef CIOneSample0D < spm1d.stats.ci.CISingleMean & spm1d.stats.ci.CI0D
    methods
        function [self]  = CIOneSample0D(spmi, mn, hstar, mu)
            self@spm1d.stats.ci.CI0D(spmi)
            self@spm1d.stats.ci.CISingleMean(spmi, mn, hstar, mu)
        end
    end
end


        

