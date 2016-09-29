%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef CalculatorHotellings2 < spm1d.stats.nonparam.calculators.ACalculatorTwoSample
    properties
        I
        Q
        JABAB
    end
    
    methods
        function [self] = CalculatorHotellings2(JA, JB, I, Q)
            self@spm1d.stats.nonparam.calculators.ACalculatorTwoSample(JA, JB)
            self.JABAB  = (JA*JB) / (JA+JB);
            self.I  = I;
            self.Q  = Q;
        end
        
        function [z] = T2_single_node(self, yA, yB)
            [mA,mB] = deal(mean(yA), mean(yB));
            [WA,WB] = deal(cov(yA), cov(yB));
            W       = (self.JA1*WA + self.JB1*WB) / self.df;
            m       = mB - mA;
            z       = self.JABAB * m * (W\m');
        end


        function [z] = get_test_stat(self, yA, yB)
            if self.Q==1
                z   = self.T2_single_node(yA, yB);
            else
                z   = zeros(1, self.Q);
                for i = 1:self.Q
                    z(i) = self.T2_single_node( squeeze(yA(:,i,:)), squeeze(yB(:,i,:)) );
                end
            end
        end

    end
end



