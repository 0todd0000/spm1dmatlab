%__________________________________________________________________________
% Copyright (C) 2025 Todd Pataky



classdef PermuterANOVA2nested_0D < spm1d.stats.nonparam_old.permuters.APermuterANOVA0DmultiF
    methods
        function [self] = PermuterANOVA2nested_0D(y, A, B)
            self@spm1d.stats.nonparam_old.permuters.APermuterANOVA0DmultiF(y, A, B)
            self.calc           = spm1d.stats.nonparam_old.calculators.CalculatorANOVA2nested(self.A, self.B);
            self.nEffects       = 2;
        end
    end
end



