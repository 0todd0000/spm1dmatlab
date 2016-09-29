%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef PermuterANOVA2onerm_1D < spm1d.stats.nonparam.permuters.APermuterANOVA1DmultiF
    methods
        function [self] = PermuterANOVA2onerm_1D(y, A, B, SUBJ)
            self@spm1d.stats.nonparam.permuters.APermuterANOVA1DmultiF(y, A, B, 'SUBJ', SUBJ)
            self.calc           = spm1d.stats.nonparam.calculators.CalculatorANOVA2onerm(self.A, self.B, self.SUBJ);
            self.nEffects       = 3;
        end
    end
end



