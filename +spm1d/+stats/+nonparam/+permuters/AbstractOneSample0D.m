%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM.m 2 2016-03-30 17:01 todd $


classdef (Abstract) AbstractOneSample0D < spm1d.stats.nonparam.permuters.AbstractOneSample & spm1d.stats.nonparam.permuters.Abstract0D
    
    methods
        function [self] = AbstractOneSample0D(y, mu)
            self.Y          = y;
            self.J          = numel( self.Y );
            self.N          = self.J;
            self.mu         = mu;
            self.labels0    = ones(self.N, 1);
            self.nPermTotal = 2 ^ self.N;
        end
        
        function [z] = get_test_stat(self, signs)
            y = signs .* (self.Y - self.mu);
            z = self.calc.get_test_stat_mu_subtracted( y );
        end
        
    end
end



