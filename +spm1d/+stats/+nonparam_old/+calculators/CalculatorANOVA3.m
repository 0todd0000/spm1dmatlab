%__________________________________________________________________________
% Copyright (C) 2025 Todd Pataky



classdef CalculatorANOVA3 < spm1d.stats.nonparam_old.calculators.ACalculatorANOVAmultiF
    methods
        function [self] = CalculatorANOVA3(A, B, C)
            self.design   = spm1d.stats.anova.designs.ANOVA3(A, B, C);
        end
    end
end



