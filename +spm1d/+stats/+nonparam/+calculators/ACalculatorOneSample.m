%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef (Abstract) ACalculatorOneSample
    properties
        J    %number of responses
        mu   %datum
    end
    
    methods
        function [self] = ACalculatorOneSample(J, mu)
            self.J  = J;
            self.mu = mu;
        end
        
        function [z] = get_test_stat(self, y)
            z = self.get_test_stat_mu_subtracted( y - self.mu );
        end
    end
    
    methods (Abstract)
        [z] = get_test_stat_mu_subtracted(self, y)
    end
end



