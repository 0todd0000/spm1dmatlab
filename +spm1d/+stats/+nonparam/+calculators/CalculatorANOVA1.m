%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM.m 2 2016-03-30 17:01 todd $


classdef CalculatorANOVA1 < spm1d.stats.nonparam.calculators.ACalculatorANOVAsingleF
    methods
        function [self] = CalculatorANOVA1(A)
            self.design   = spm1d.stats.anova.designs.ANOVA1(A);
        end
    end
end



