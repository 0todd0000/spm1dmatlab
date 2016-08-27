%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM.m 2 2016-03-30 17:01 todd $


classdef PermuterTtest20D < spm1d.stats.nonparam.permuters.APermuterTwoSample & spm1d.stats.nonparam.permuters.APermuter0D
    methods
        function [self] = PermuterTtest20D(yA, yB)
            self@spm1d.stats.nonparam.permuters.APermuterTwoSample(yA, yB)
            self.calc = spm1d.stats.nonparam.calculators.CalculatorTtest2(self.JA, self.JB);
        end
    end
end



