%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef (Abstract) ACalculatorTwoSample
    properties
        JA1    %number of responses (Group A) minus 1
        JB1    %number of responses (Group B) minus 1
        df     %degrees of freedom
    end
    
    methods
        function [self] = ACalculatorTwoSample(JA, JB)
            self.JA1  = JA - 1;
            self.JB1  = JB - 1;
            self.df   = JA + JB - 2;
        end
    end
end

