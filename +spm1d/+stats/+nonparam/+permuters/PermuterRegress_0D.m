%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef PermuterRegress_0D < spm1d.stats.nonparam.permuters.APermuterRegress & spm1d.stats.nonparam.permuters.APermuter0D
    methods
        function [self] = PermuterRegress_0D(y, x)
            self@spm1d.stats.nonparam.permuters.APermuterRegress(y, x)
            self.calc = spm1d.stats.nonparam.calculators.CalculatorRegress(x);
        end
    end
end


