%__________________________________________________________________________
% Copyright (C) 2025 Todd Pataky



classdef PermuterMANOVA1_0D < spm1d.stats.nonparam_old.permuters.APermuterANOVA & spm1d.stats.nonparam_old.permuters.APermuter0D
    methods
        function [self] = PermuterMANOVA1_0D(y, A)
            self@spm1d.stats.nonparam_old.permuters.APermuterANOVA(y, A)
            I                   = size(y, ndims(y));
            Q                   = 1;
            self.calc           = spm1d.stats.nonparam_old.calculators.CalculatorMANOVA1(self.A, I, Q);
            self.ismultivariate = true;
        end
    end
end



