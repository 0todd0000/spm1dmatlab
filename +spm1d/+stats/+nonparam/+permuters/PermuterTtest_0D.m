%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef PermuterTtest_0D < spm1d.stats.nonparam.permuters.APermuterOneSample0D
    methods
        function [self] = PermuterTtest_0D(y, mu)
            self@spm1d.stats.nonparam.permuters.APermuterOneSample0D(y, mu)
            self.calc = spm1d.stats.nonparam.calculators.CalculatorTtest(self.J, self.mu);
        end
    end
end



