%__________________________________________________________________________
% Copyright (C) 2025 Todd Pataky



classdef PermuterANOVA1rm_1D < spm1d.stats.nonparam_old.permuters.APermuterANOVA & spm1d.stats.nonparam_old.permuters.APermuter1D
    methods
        function [self] = PermuterANOVA1rm_1D(y, A, SUBJ)
            self@spm1d.stats.nonparam_old.permuters.APermuterANOVA(y, A, 'SUBJ',SUBJ)
            self.calc           = spm1d.stats.nonparam_old.calculators.CalculatorANOVA1rm(self.A, self.SUBJ);
        end
    end
end



