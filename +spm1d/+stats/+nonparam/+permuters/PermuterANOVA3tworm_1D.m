%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM.m 2 2016-03-30 17:01 todd $


classdef PermuterANOVA3tworm_1D < spm1d.stats.nonparam.permuters.APermuterANOVA1DmultiF
    methods
        function [self] = PermuterANOVA3tworm_1D(y, A, B, C, SUBJ)
            self@spm1d.stats.nonparam.permuters.APermuterANOVA1DmultiF(y, A, B, C, SUBJ)
            self.calc           = spm1d.stats.nonparam.calculators.CalculatorANOVA3tworm(self.A, self.B, self.C, self.SUBJ);
            self.nEffects       = 7;
        end
    end
end



