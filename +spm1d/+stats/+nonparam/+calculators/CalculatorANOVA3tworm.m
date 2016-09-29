%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef CalculatorANOVA3tworm < spm1d.stats.nonparam.calculators.ACalculatorANOVAmultiF
    methods
        function [self] = CalculatorANOVA3tworm(A, B, C, SUBJ)
            self.design   = spm1d.stats.anova.designs.ANOVA3tworm(A, B, C, SUBJ);
        end
    end
end



