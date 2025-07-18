%__________________________________________________________________________
% Copyright (C) 2025 Todd Pataky



classdef PermuterANOVA3onerm_1D < spm1d.stats.nonparam_old.permuters.APermuterANOVA1DmultiF
    methods
        function [self] = PermuterANOVA3onerm_1D(y, A, B, C, SUBJ)
            self@spm1d.stats.nonparam_old.permuters.APermuterANOVA1DmultiF(y, A, B, C, SUBJ)
            self.calc           = spm1d.stats.nonparam_old.calculators.CalculatorANOVA3onerm(self.A, self.B, self.C, self.SUBJ);
            self.nEffects       = 7;
        end
    end
end



