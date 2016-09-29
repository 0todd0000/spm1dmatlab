%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef (Abstract) APermuterOneSample0D < spm1d.stats.nonparam.permuters.APermuterOneSample & spm1d.stats.nonparam.permuters.APermuter0D
    
    methods
        function [self] = APermuterOneSample0D(y, mu)
            self.Y          = y;
            self.J          = size(y, 1);
            self.I          = size(y, 2);
            self.N          = self.J;
            self.mu         = mu;
            self.labels0    = ones(self.N, 1);
            self.nPermTotal = 2 ^ self.N;
        end
        
        function [z] = get_test_stat(self, signs)
            signs = repmat(signs, [1,self.I]);
            y     = signs .* (self.Y - self.calc.mu);
            z     = self.calc.get_test_stat_mu_subtracted( y );
        end
        
    end
end



