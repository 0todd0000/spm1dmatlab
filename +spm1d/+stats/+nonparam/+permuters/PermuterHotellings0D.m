%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM.m 2 2016-03-30 17:01 todd $


classdef PermuterHotellings0D < spm1d.stats.nonparam.permuters.APermuterOneSample0D
    methods
        function [self] = PermuterHotellings0D(y, mu)
            self@spm1d.stats.nonparam.permuters.APermuterOneSample0D(y, mu)
            [I,Q]               = deal(size(y,2), 1);
            self.calc           = spm1d.stats.nonparam.calculators.CalculatorHotellings(self.J, self.mu, I, Q);
            self.ismultivariate = true;
        end
    end
end



