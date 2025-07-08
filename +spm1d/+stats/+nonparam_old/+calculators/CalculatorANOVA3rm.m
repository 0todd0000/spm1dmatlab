%__________________________________________________________________________
% Copyright (C) 2025 Todd Pataky



classdef CalculatorANOVA3rm < spm1d.stats.nonparam_old.calculators.ACalculatorANOVAmultiF
    methods
        function [self] = CalculatorANOVA3rm(A, B, C, SUBJ)
            self.design   = spm1d.stats.anova.designs.ANOVA3rm(A, B, C, SUBJ);
        end
    end
end



