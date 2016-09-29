%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef PermuterANOVA2onerm_0D < spm1d.stats.nonparam.permuters.APermuterANOVA0DmultiF
    methods
        function [self] = PermuterANOVA2onerm_0D(y, A, B, SUBJ)
            self@spm1d.stats.nonparam.permuters.APermuterANOVA0DmultiF(y, A, B, 'SUBJ', SUBJ)
            self.calc           = spm1d.stats.nonparam.calculators.CalculatorANOVA2onerm(self.A, self.B, self.SUBJ);
            self.nEffects       = 3;
        end
    end
end



