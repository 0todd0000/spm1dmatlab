%__________________________________________________________________________
% Copyright (C) 2025 Todd Pataky



classdef PermuterCCA_1D < spm1d.stats.nonparam_old.permuters.APermuterRegress & spm1d.stats.nonparam_old.permuters.APermuter1D
    methods
        function [self] = PermuterCCA_1D(y, x)
            self@spm1d.stats.nonparam_old.permuters.APermuterRegress(y, x)
            [~,Q,I]     = size(y);
            self.calc   = spm1d.stats.nonparam_old.calculators.CalculatorCCA(x, I, Q);
            self.ismultivariate = true;
        end
    end
end


