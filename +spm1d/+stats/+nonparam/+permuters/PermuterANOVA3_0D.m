%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef PermuterANOVA3_0D < spm1d.stats.nonparam.permuters.APermuterANOVA0DmultiF
    methods
        function [self] = PermuterANOVA3_0D(y, A, B, C)
            self@spm1d.stats.nonparam.permuters.APermuterANOVA0DmultiF(y, A, B, C)
            self.calc           = spm1d.stats.nonparam.calculators.CalculatorANOVA3(self.A, self.B, self.C);
            self.nEffects       = 7;
        end
    end
end



