%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM.m 2 2016-03-30 17:01 todd $


classdef CalculatorANOVA1rm < spm1d.stats.nonparam.calculators.ACalculatorANOVAsingleF
    methods
        function [self] = CalculatorANOVA1rm(A, SUBJ)
            self.design   = spm1d.stats.anova.designs.ANOVA1rm(A, SUBJ);
        end
    end
end



