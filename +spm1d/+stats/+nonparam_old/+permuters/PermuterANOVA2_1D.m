%__________________________________________________________________________
% Copyright (C) 2025 Todd Pataky



classdef PermuterANOVA2_1D < spm1d.stats.nonparam_old.permuters.APermuterANOVA1DmultiF
    methods
        function [self] = PermuterANOVA2_1D(y, A, B)
            self@spm1d.stats.nonparam_old.permuters.APermuterANOVA1DmultiF(y, A, B)
            self.calc           = spm1d.stats.nonparam_old.calculators.CalculatorANOVA2(self.A, self.B);
            self.nEffects       = 3;
        end
    end
end



