%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef CalculatorANOVA1rm < spm1d.stats.nonparam.calculators.ACalculatorANOVAsingleF
    methods
        function [self] = CalculatorANOVA1rm(A, SUBJ)
            self.design   = spm1d.stats.anova.designs.ANOVA1rm(A, SUBJ);
        end
    end
end



