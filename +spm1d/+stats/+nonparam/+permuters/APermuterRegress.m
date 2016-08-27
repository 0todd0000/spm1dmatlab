%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM.m 2 2016-03-30 17:01 todd $


classdef (Abstract) APermuterRegress < spm1d.stats.nonparam.permuters.APermuter
    properties
        J            %number of responses
        x            %independent variable
    end
    
    
    methods
    
        function [self] = APermuterRegress(y, x)
            self.Y          = y;
            self.x          = x;
            self.J          = numel(x);
            self.labels0    = (1 : self.J)';
            self.nPermTotal = factorial( self.J );
        end


        function [self] = build_pdf(self, iterations)
            if iterations==-1
                n        = self.nPermTotal;
                Z        = zeros(n, 1);
                IND      = perms( 1:self.J );
                for i = 1:n
                    Z(i) = self.get_test_stat( IND(i,:)' );
                end
            else
                n        = iterations;
                Z        = zeros(n, 1);
                for i = 1:n
                    ind  = randperm( self.J );
                    Z(i) = self.get_test_stat( ind' );
                end
            end
            self.Z   = Z;
        end
        
        
        function [z] = get_test_stat(self, labels)
            z       = self.calc.get_test_stat( self.Y(labels,:) );
        end
    end
    
    
    
end



