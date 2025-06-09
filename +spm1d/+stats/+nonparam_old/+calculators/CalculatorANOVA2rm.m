%__________________________________________________________________________
% Copyright (C) 2025 Todd Pataky



classdef CalculatorANOVA2rm < spm1d.stats.nonparam_old.calculators.ACalculatorANOVAmultiF
    methods
        function [self] = CalculatorANOVA2rm(A, B, SUBJ)
            self.design   = spm1d.stats.anova.designs.ANOVA2rm(A, B, SUBJ);
        end
    end
end



