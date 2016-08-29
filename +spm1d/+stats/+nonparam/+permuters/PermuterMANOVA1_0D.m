%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM.m 2 2016-03-30 17:01 todd $


classdef PermuterMANOVA1_0D < spm1d.stats.nonparam.permuters.APermuterANOVA & spm1d.stats.nonparam.permuters.APermuter0D
    methods
        function [self] = PermuterMANOVA1_0D(y, A)
            self@spm1d.stats.nonparam.permuters.APermuterANOVA(y, A)
            I                   = size(y, ndims(y));
            self.calc           = spm1d.stats.nonparam.calculators.CalculatorMANOVA1(self.A, I);
            self.ismultivariate = true;
        end
    end
end



