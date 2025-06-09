%__________________________________________________________________________
% Copyright (C) 2025 Todd Pataky



classdef PermuterANOVA3nested_0D < spm1d.stats.nonparam_old.permuters.APermuterANOVA0DmultiF
    methods
        function [self] = PermuterANOVA3nested_0D(y, A, B, C)
            self@spm1d.stats.nonparam_old.permuters.APermuterANOVA0DmultiF(y, A, B, C)
            self.calc           = spm1d.stats.nonparam_old.calculators.CalculatorANOVA3nested(self.A, self.B, self.C);
            self.nEffects       = 3;
        end
    end
end



