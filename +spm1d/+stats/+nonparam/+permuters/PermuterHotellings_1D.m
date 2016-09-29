%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef PermuterHotellings_1D < spm1d.stats.nonparam.permuters.APermuterOneSample1D
    methods
        function [self] = PermuterHotellings_1D(y, mu)
            self@spm1d.stats.nonparam.permuters.APermuterOneSample1D(y, mu)
            [J,Q,I]             = size(y);
            self.calc           = spm1d.stats.nonparam.calculators.CalculatorHotellings(J, self.mu, I, Q);
            self.ismultivariate = true;
        end
    end
end



