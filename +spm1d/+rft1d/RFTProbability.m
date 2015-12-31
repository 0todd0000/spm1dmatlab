%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: RFTProbability.m 1 2016-01-04 16:07 todd $

classdef RFTProbability
    properties (Access=private)
        calc    %link to an RFTCalculator object
    end
    methods
        function self = RFTProbability(calc)
            self.calc = calc;  
       end
       function p = cluster(self, k, u)
           c = self.calc;
           p = spm_P(1, k, u, c.df, c.STAT, c.resels, c.n, c.Q);
       end
       function p = set(self, c, k, u)
           cc = self.calc;
           p  = spm_P_RF(c, k, u, cc.df, cc.STAT, cc.resels, 1);
       end
       function p = upcrossing(self, u)
           c = self.calc;
           p = spm_P(1, 0, u, c.df, c.STAT, c.resels, c.n, c.Q);
       end
   end
end







