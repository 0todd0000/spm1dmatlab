%__________________________________________________________________________
% Copyright (C) 2025 Todd Pataky



classdef PermuterTtest2_0D < spm1d.stats.nonparam_old.permuters.APermuterTwoSample & spm1d.stats.nonparam_old.permuters.APermuter0D
    methods
        function [self] = PermuterTtest2_0D(yA, yB)
            self@spm1d.stats.nonparam_old.permuters.APermuterTwoSample(yA, yB)
            self.calc = spm1d.stats.nonparam_old.calculators.CalculatorTtest2(self.JA, self.JB);
        end
    end
end



