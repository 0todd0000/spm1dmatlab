%__________________________________________________________________________
% Copyright (C) 2025 Todd Pataky



classdef PermuterMANOVA1_1D < spm1d.stats.nonparam_old.permuters.APermuterANOVA & spm1d.stats.nonparam_old.permuters.APermuter1D
    methods
        function [self] = PermuterMANOVA1_1D(y, A)
            self@spm1d.stats.nonparam_old.permuters.APermuterANOVA(y, A)
            [~,Q,I]             = size(y);
            self.calc           = spm1d.stats.nonparam_old.calculators.CalculatorMANOVA1(self.A, I, Q);
            self.ismultivariate = true;
        end
    end
end



