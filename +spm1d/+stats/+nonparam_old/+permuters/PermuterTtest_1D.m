%__________________________________________________________________________
% Copyright (C) 2025 Todd Pataky



classdef PermuterTtest_1D < spm1d.stats.nonparam_old.permuters.APermuterOneSample1D
    methods
        function [self] = PermuterTtest_1D(y, mu)
            self@spm1d.stats.nonparam_old.permuters.APermuterOneSample1D(y, mu)
            self.calc = spm1d.stats.nonparam_old.calculators.CalculatorTtest(self.J, self.mu);
        end
    end
end



