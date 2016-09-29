%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef PermuterANOVA3rm_0D < spm1d.stats.nonparam.permuters.APermuterANOVA0DmultiF
    methods
        function [self] = PermuterANOVA3rm_0D(y, A, B, C, SUBJ)
            self@spm1d.stats.nonparam.permuters.APermuterANOVA0DmultiF(y, A, B, C, SUBJ)
            self.calc           = spm1d.stats.nonparam.calculators.CalculatorANOVA3rm(self.A, self.B, self.C, self.SUBJ);
            self.nEffects       = 7;
        end
    end
end



