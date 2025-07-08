%__________________________________________________________________________
% Copyright (C) 2025 Todd Pataky



classdef PermuterHotellings2_1D < spm1d.stats.nonparam_old.permuters.APermuterTwoSample & spm1d.stats.nonparam_old.permuters.APermuter1D
    methods
        function [self] = PermuterHotellings2_1D(yA, yB)
            self@spm1d.stats.nonparam_old.permuters.APermuterTwoSample(yA, yB)
            [JA,Q,I]  = size(yA);
            JB        = size(yB, 1);
            self.calc = spm1d.stats.nonparam_old.calculators.CalculatorHotellings2(JA, JB, I, Q);
            self.ismultivariate = true;
        end
    end
end



