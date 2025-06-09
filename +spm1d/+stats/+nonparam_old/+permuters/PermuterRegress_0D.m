%__________________________________________________________________________
% Copyright (C) 2025 Todd Pataky



classdef PermuterRegress_0D < spm1d.stats.nonparam_old.permuters.APermuterRegress & spm1d.stats.nonparam_old.permuters.APermuter0D
    methods
        function [self] = PermuterRegress_0D(y, x)
            self@spm1d.stats.nonparam_old.permuters.APermuterRegress(y, x)
            self.calc = spm1d.stats.nonparam_old.calculators.CalculatorRegress(x);
        end
    end
end


