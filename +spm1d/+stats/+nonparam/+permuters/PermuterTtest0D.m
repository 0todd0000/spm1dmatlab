%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM.m 2 2016-03-30 17:01 todd $


classdef PermuterTtest0D < spm1d.stats.nonparam.permuters.APermuterOneSample0D
    methods
        function [self] = PermuterTtest0D(y, mu)
            self@spm1d.stats.nonparam.permuters.APermuterOneSample0D(y, mu)
            self.calc = spm1d.stats.nonparam.calculators.CalculatorTtest(self.J, self.mu);
        end
    end
end



