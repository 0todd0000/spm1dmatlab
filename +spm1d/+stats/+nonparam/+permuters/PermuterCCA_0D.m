%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef PermuterCCA_0D < spm1d.stats.nonparam.permuters.APermuterRegress & spm1d.stats.nonparam.permuters.APermuter0D
    methods
        function [self] = PermuterCCA_0D(y, x)
            self@spm1d.stats.nonparam.permuters.APermuterRegress(y, x)
            I           = size(y, 2);
            Q           = 1;
            self.calc   = spm1d.stats.nonparam.calculators.CalculatorCCA(x, I, Q);
            self.ismultivariate = true;
        end
    end
end


