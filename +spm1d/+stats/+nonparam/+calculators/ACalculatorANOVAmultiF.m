%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky


classdef (Abstract) ACalculatorANOVAmultiF
    properties
        design
    end
    methods
        function [z] = get_test_stat(self, y)
            model   = spm1d.stats.anova.LinearModel(y, self.design.X);
            model   = model.fit();
            spms    = model.aov(self.design.contrasts, self.design.f_terms);
            n       = numel(spms);
            Q       = spms{1}.Q;
            z       = zeros(Q, n);
            for i=1:n
                z(:,i) = spms{i}.z;
            end
        end
    end
end



