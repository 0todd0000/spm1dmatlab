%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef PermuterHotellings2_1D < spm1d.stats.nonparam.permuters.APermuterTwoSample & spm1d.stats.nonparam.permuters.APermuter1D
    methods
        function [self] = PermuterHotellings2_1D(yA, yB)
            self@spm1d.stats.nonparam.permuters.APermuterTwoSample(yA, yB)
            [JA,Q,I]  = size(yA);
            JB        = size(yB, 1);
            self.calc = spm1d.stats.nonparam.calculators.CalculatorHotellings2(JA, JB, I, Q);
            self.ismultivariate = true;
        end
    end
end



