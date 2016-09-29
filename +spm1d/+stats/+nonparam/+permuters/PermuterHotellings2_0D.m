%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef PermuterHotellings2_0D < spm1d.stats.nonparam.permuters.APermuterTwoSample & spm1d.stats.nonparam.permuters.APermuter0D
    methods
        function [self] = PermuterHotellings2_0D(yA, yB)
            self@spm1d.stats.nonparam.permuters.APermuterTwoSample(yA, yB)
            [JA,I]    = size(yA);
            [JB,~]    = size(yB);
            Q         = 1;
            self.calc = spm1d.stats.nonparam.calculators.CalculatorHotellings2(JA, JB, I, Q);
            self.ismultivariate = true;
        end
    end
end



