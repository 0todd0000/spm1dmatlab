%__________________________________________________________________________
% Copyright (C) 2025 Todd Pataky



classdef PermuterCCA_0D < spm1d.stats.nonparam_old.permuters.APermuterRegress & spm1d.stats.nonparam_old.permuters.APermuter0D
    methods
        function [self] = PermuterCCA_0D(y, x)
            self@spm1d.stats.nonparam_old.permuters.APermuterRegress(y, x)
            I           = size(y, 2);
            Q           = 1;
            self.calc   = spm1d.stats.nonparam_old.calculators.CalculatorCCA(x, I, Q);
            self.ismultivariate = true;
        end
    end
end


