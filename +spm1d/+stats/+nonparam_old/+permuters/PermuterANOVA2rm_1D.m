%__________________________________________________________________________
% Copyright (C) 2025 Todd Pataky



classdef PermuterANOVA2rm_1D < spm1d.stats.nonparam_old.permuters.APermuterANOVA1DmultiF
    methods
        function [self] = PermuterANOVA2rm_1D(y, A, B, SUBJ)
            self@spm1d.stats.nonparam_old.permuters.APermuterANOVA1DmultiF(y, A, B, 'SUBJ', SUBJ)
            self.calc           = spm1d.stats.nonparam_old.calculators.CalculatorANOVA2rm(self.A, self.B, self.SUBJ);
            self.nEffects       = 3;
        end
    end
end



