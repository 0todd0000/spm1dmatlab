%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef PermuterTtest2_0D < spm1d.stats.nonparam.permuters.APermuterTwoSample & spm1d.stats.nonparam.permuters.APermuter0D
    methods
        function [self] = PermuterTtest2_0D(yA, yB)
            self@spm1d.stats.nonparam.permuters.APermuterTwoSample(yA, yB)
            self.calc = spm1d.stats.nonparam.calculators.CalculatorTtest2(self.JA, self.JB);
        end
    end
end



