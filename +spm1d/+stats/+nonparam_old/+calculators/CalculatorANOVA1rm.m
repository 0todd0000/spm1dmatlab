%__________________________________________________________________________
% Copyright (C) Copyright (C) 2026  Todd Pataky Todd Pataky



classdef CalculatorANOVA1rm < spm1d.stats.nonparam_old.calculators.ACalculatorANOVAsingleF
    methods
        function [self] = CalculatorANOVA1rm(A, SUBJ)
            self.design   = spm1d.stats.anova.designs.ANOVA1rm(A, SUBJ);
        end
    end
end



