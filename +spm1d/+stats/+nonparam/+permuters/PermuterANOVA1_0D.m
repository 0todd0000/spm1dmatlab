%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef PermuterANOVA1_0D < spm1d.stats.nonparam.permuters.APermuterANOVA & spm1d.stats.nonparam.permuters.APermuter0D
    methods
        function [self] = PermuterANOVA1_0D(y, A)
            self@spm1d.stats.nonparam.permuters.APermuterANOVA(y, A)
            self.calc           = spm1d.stats.nonparam.calculators.CalculatorANOVA1(self.A);
        end
    end
end



