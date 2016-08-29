%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM.m 2 2016-03-30 17:01 todd $


classdef (Abstract) ACalculatorANOVAsingleF
    properties
        design
    end
    methods
        function [z] = get_test_stat(self, y)
            model  = spm1d.stats.anova.LinearModel(y, self.design.X);
            model  = model.fit();
            spm    = model.aov(self.design.contrasts, self.design.f_terms);
            z      = spm{1}.z;
        end
    end
end



