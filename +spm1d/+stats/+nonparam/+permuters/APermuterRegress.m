%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef (Abstract) APermuterRegress < spm1d.stats.nonparam.permuters.APermuter
    properties
        J            %number of responses
        x            %independent variable
    end
    
    
    methods
    
        function [self] = APermuterRegress(y, x)
            self.Y          = y;
            self.Q          = size(y, 2);
            self.x          = x;
            self.J          = numel(x);
            self.labels0    = (1 : self.J)';
            self.nPermTotal = factorial( self.J );
        end


        function [self] = build_pdf(self, iterations)
            if iterations==-1
                n        = self.nPermTotal;
                Z        = zeros(n, self.Q);
                IND      = perms( 1:self.J );
                for i = 1:n
                    Z(i,:) = self.get_test_stat( IND(i,:)' );
                end
            else
                n          = iterations;
                Z          = zeros(n, self.Q);
                for i = 1:n
                    ind    = randperm( self.J );
                    Z(i,:) = self.get_test_stat( ind' );
                end
            end
            self.Z         = max(Z, [], 2);
            if self.dim == 1
                self.ZZ    = Z;
            end
        end
        
        
        function [z] = get_test_stat(self, labels)
            if self.dim==1
                z       = self.calc.get_test_stat( self.Y(labels,:,:) );
            else
                z       = self.calc.get_test_stat( self.Y(labels,:) );
            end
        end
    end
    
    
    
end



