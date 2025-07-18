%__________________________________________________________________________
% Copyright (C) 2025 Todd Pataky



classdef PermuterHotellings_0D < spm1d.stats.nonparam_old.permuters.APermuterOneSample0D
    methods
        function [self] = PermuterHotellings_0D(y, mu)
            self@spm1d.stats.nonparam_old.permuters.APermuterOneSample0D(y, mu)
            [I,Q]               = deal(size(y,2), 1);
            self.calc           = spm1d.stats.nonparam_old.calculators.CalculatorHotellings(self.J, self.mu, I, Q);
            self.ismultivariate = true;
        end
    end
end



