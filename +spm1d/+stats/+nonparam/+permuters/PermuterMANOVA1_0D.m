%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef PermuterMANOVA1_0D < spm1d.stats.nonparam.permuters.APermuterANOVA & spm1d.stats.nonparam.permuters.APermuter0D
    methods
        function [self] = PermuterMANOVA1_0D(y, A)
            self@spm1d.stats.nonparam.permuters.APermuterANOVA(y, A)
            I                   = size(y, ndims(y));
            Q                   = 1;
            self.calc           = spm1d.stats.nonparam.calculators.CalculatorMANOVA1(self.A, I, Q);
            self.ismultivariate = true;
        end
    end
end



