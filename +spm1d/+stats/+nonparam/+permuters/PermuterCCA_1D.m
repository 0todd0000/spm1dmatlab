%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef PermuterCCA_1D < spm1d.stats.nonparam.permuters.APermuterRegress & spm1d.stats.nonparam.permuters.APermuter1D
    methods
        function [self] = PermuterCCA_1D(y, x)
            self@spm1d.stats.nonparam.permuters.APermuterRegress(y, x)
            [~,Q,I]     = size(y);
            self.calc   = spm1d.stats.nonparam.calculators.CalculatorCCA(x, I, Q);
            self.ismultivariate = true;
        end
    end
end


