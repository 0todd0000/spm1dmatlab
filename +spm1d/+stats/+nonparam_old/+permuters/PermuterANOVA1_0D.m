%__________________________________________________________________________
% Copyright (C) 2025 Todd Pataky



classdef PermuterANOVA1_0D < spm1d.stats.nonparam_old.permuters.APermuterANOVA & spm1d.stats.nonparam_old.permuters.APermuter0D
    methods
        function [self] = PermuterANOVA1_0D(y, A)
            self@spm1d.stats.nonparam_old.permuters.APermuterANOVA(y, A)
            self.calc           = spm1d.stats.nonparam_old.calculators.CalculatorANOVA1(self.A);
        end
    end
end



