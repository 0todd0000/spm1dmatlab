%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM.m 2 2016-03-30 17:01 todd $


classdef PermuterMANOVA1_1D < spm1d.stats.nonparam.permuters.APermuterANOVA & spm1d.stats.nonparam.permuters.APermuter1D
    methods
        function [self] = PermuterMANOVA1_1D(y, A)
            self@spm1d.stats.nonparam.permuters.APermuterANOVA(y, A)
            [J,Q,I]             = size(y);
            self.calc           = spm1d.stats.nonparam.calculators.CalculatorMANOVA1(self.A, I, Q);
            self.ismultivariate = true;
        end
    end
end



