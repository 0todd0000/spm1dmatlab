%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM.m 2 2016-03-30 17:01 todd $


classdef PermuterANOVA2_1D < spm1d.stats.nonparam.permuters.APermuterANOVA1DmultiF
    methods
        function [self] = PermuterANOVA2_1D(y, A, B)
            self@spm1d.stats.nonparam.permuters.APermuterANOVA1DmultiF(y, A, B)
            self.calc           = spm1d.stats.nonparam.calculators.CalculatorANOVA2(self.A, self.B);
            self.nEffects       = 3;
        end
    end
end



