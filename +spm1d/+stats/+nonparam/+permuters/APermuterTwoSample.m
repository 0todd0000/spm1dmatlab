%__________________________________________________________________________
% Copyright (C) 2025 Todd Pataky



classdef APermuterTwoSample < spm1d.stats.nonparam.permuters.APermuter
    properties
        JA            %number of responses (Group A)
        JB            %number of responses (Group B)
        J             %total number of responses
        labelsZeros   %empty labels
    end
    
    
    methods

        function [self] = APermuterTwoSample(yA, yB)
            self.Y           = self.stack(yA, yB);
            self.Q           = size(yA, 2);
            self.JA          = size(yA, 1);
            self.JB          = size(yB, 1);
            self.J           = self.JA + self.JB;
            self.labels0     = [zeros(self.JA, 1); ones(self.JB, 1)];
            self.labelsZeros = zeros(self.J, 1);
            %calculate total number of permutations
            if isinf( factorial(self.J) )
                nPerm        = inf;
            else
                nPerm        = factorial(self.J) / ( factorial(self.JA) * factorial(self.JB)  );
            end
            self.nPermTotal  = nPerm;
        end

        function [self] = build_pdf(self, iterations, varargin)
            %parse varargin
            parser      = inputParser;
            addOptional(parser, 'two_tailed', false, @islogical);
            parser.parse(varargin{:});
            two_tailed  = parser.Results.two_tailed;
            if iterations==-1
                ONES     = nchoosek( 1:self.J, self.JA );
                n        = self.nPermTotal;
                if two_tailed
                    Z    = zeros(n/2, self.Q);
                    for i = 1:(n/2)
                        Z(i,:) = self.get_test_stat_ones( ONES(i,:)' );
                    end
                else
                    Z    = zeros(n, self.Q);
                    for i = 1:n
                        Z(i,:) = self.get_test_stat_ones( ONES(i,:)' );
                    end
                end
            else
                n        = iterations;
                Z        = zeros(n, self.Q);
                for i = 1:n
                    ONES = randperm(self.J, self.JA);
                    Z(i,:) = self.get_test_stat_ones( ONES' );
                end
            end
            if two_tailed
                self.Z         = max(abs(Z), [], 2);
            else
                self.Z         = max(Z, [], 2);
            end
            if self.dim == 1
                self.ZZ    = Z;
            end
        end
        
        
        function [z] = get_test_stat(self, labels)
            if self.Q==1
                [yA,yB] = deal( self.Y(labels==0,:), self.Y(labels==1,:) );
            else
                [yA,yB] = deal( self.Y(labels==0,:,:), self.Y(labels==1,:,:) );
            end
            z       = self.calc.get_test_stat(yA, yB);
        end

        function [z] = get_test_stat_ones(self, ONES)
            labels       = self.labelsZeros;
            labels(ONES) = 1;
            z            = self.get_test_stat( labels );
        end

    end
    
    methods (Access = protected)
        function [y] = stack(~, yA, yB)
            y   = [yA; yB];
        end
    end
    
    
    
end



