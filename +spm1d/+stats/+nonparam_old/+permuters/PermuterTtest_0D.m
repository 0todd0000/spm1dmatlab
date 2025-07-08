%__________________________________________________________________________
% Copyright (C) 2025 Todd Pataky



classdef PermuterTtest_0D < spm1d.stats.nonparam_old.permuters.APermuterOneSample0D
    methods
        function [self] = PermuterTtest_0D(y, mu)
            self@spm1d.stats.nonparam_old.permuters.APermuterOneSample0D(y, mu)
            self.calc = spm1d.stats.nonparam_old.calculators.CalculatorTtest(self.J, self.mu);
        end
    end
end



