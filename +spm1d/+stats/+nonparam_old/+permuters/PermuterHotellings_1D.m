%__________________________________________________________________________
% Copyright (C) Copyright (C) 2026  Todd Pataky Todd Pataky



classdef PermuterHotellings_1D < spm1d.stats.nonparam_old.permuters.APermuterOneSample1D
    methods
        function [self] = PermuterHotellings_1D(y, mu)
            self@spm1d.stats.nonparam_old.permuters.APermuterOneSample1D(y, mu)
            [J,Q,I]             = size(y);
            self.calc           = spm1d.stats.nonparam_old.calculators.CalculatorHotellings(J, self.mu, I, Q);
            self.ismultivariate = true;
        end
    end
end



