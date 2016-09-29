%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef CalculatorHotellings < spm1d.stats.nonparam.calculators.ACalculatorOneSample
    properties
        I
        Q
    end
    
    methods
        function [self] = CalculatorHotellings(J, mu, I, Q)
            if ~isscalar(mu)
                if Q==1
                    mu = spm1d.util.flatten(mu);
                end
                mu = repmat(mu', [J,1]);
            end
            self@spm1d.stats.nonparam.calculators.ACalculatorOneSample(J, mu)
            self.I  = I;
            self.Q  = Q;
        end
        
        function [z] = T2_single_node(self, y)
            
            m       = mean(y, 1);      %mean vector
            W       = cov(y);       %covariance
            z       = self.J * m * (W \ m');
        end


        function [z] = get_test_stat_mu_subtracted(self, y)
            if self.Q==1
                z   = self.T2_single_node(y);
            else
                z   = zeros(1, self.Q);
                for i = 1:self.Q
                    z(i) = self.T2_single_node( squeeze(y(:,i,:)) );
                end
            end
        end
        
    end
end



