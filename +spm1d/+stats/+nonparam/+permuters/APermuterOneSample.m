%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef (Abstract) APermuterOneSample
    properties
        J            %number of responses
        I            %number of vector components (1 if univariate)
        N            %number of permutable elements
        mu           %datum
    end
    
    
    methods
    
        
        function [self] = build_pdf(self, iterations)
            if iterations==-1
                n          = self.nPermTotal;
                Z          = zeros(n, self.Q);
                SIGNS      = spm1d.util.itertools_product([-1 1], self.N);
                for i = 1:n
                    Z(i,:) = self.get_test_stat( SIGNS(i,:)' )';
                end
            else
                n          = iterations;
                Z          = zeros(n, self.Q);
                signs0     = [-1*ones(self.J,1);   ones(self.J,1)];
                for i = 1:n
                    ind    = randperm( 2*self.J );
                    signs  = signs0( ind(1:self.J) );
                    Z(i,:) = self.get_test_stat( signs );
                end
            end
            self.Z         = max(Z, [], 2);
            if self.dim == 1
                self.ZZ    = Z;
            end
        end
        
        
        function [z] = get_test_stat(self, labels)
            signs   = self.get_signs( labels );
            y       = signs .* self.y;
            z       = self.calc.get_test_stat_mu_subtracted(y);
        end
    end
    
    
    
end



