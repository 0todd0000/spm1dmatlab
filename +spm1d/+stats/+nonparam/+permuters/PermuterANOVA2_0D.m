%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef PermuterANOVA2_0D < spm1d.stats.nonparam.permuters.APermuterANOVA0DmultiF
    methods
        function [self] = PermuterANOVA2_0D(y, A, B)
            self@spm1d.stats.nonparam.permuters.APermuterANOVA0DmultiF(y, A, B)
            self.calc           = spm1d.stats.nonparam.calculators.CalculatorANOVA2(self.A, self.B);
            self.nEffects       = 3;
        end
    end
end



