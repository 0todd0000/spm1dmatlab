%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef PermuterANOVA3nested_1D < spm1d.stats.nonparam.permuters.APermuterANOVA1DmultiF
    methods
        function [self] = PermuterANOVA3nested_1D(y, A, B, C)
            self@spm1d.stats.nonparam.permuters.APermuterANOVA1DmultiF(y, A, B, C)
            self.calc           = spm1d.stats.nonparam.calculators.CalculatorANOVA3nested(self.A, self.B, self.C);
            self.nEffects       = 3;
        end
    end
end



