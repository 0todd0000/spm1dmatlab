%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef (Abstract) APermuterANOVA < spm1d.stats.nonparam.permuters.APermuter
    properties
        J
        A
        B
        C
        SUBJ
    end
    
    methods
        function [self] = APermuterANOVA(y, varargin)
            parser          = inputParser;
            addOptional(parser, 'A', [], @isnumeric);
            addOptional(parser, 'B', [], @isnumeric);
            addOptional(parser, 'C', [], @isnumeric);
            addOptional(parser, 'SUBJ', [], @isnumeric);
            addOptional(parser, 'roi', [], @isnumeric);
            parser.parse(varargin{:});
            self.A          = parser.Results.A;
            self.B          = parser.Results.B;
            self.C          = parser.Results.C;
            self.SUBJ       = parser.Results.SUBJ;
            roi             = parser.Results.roi;
            %set properties:
            self.Y          = y;
            self.J          = size(y, 1);
            self.nPermTotal = factorial( self.J );
            self.labels0    = (1 : self.J)';
            if self.dim == 1
                self.Q      = size(y, 2);
            end
        end

        function [self] = build_pdf(self, iterations)
            if iterations==-1
                n        = self.nPermTotal;
                Z        = self.init_pdf(n);
                IND      = perms( 1:self.J );
                for i = 1:n
                    z    = self.get_test_stat( IND(i,:)' );
                    if (self.Q==1) || (self.nEffects==1)
                        Z(i,:) = z;
                    else
                        Z(i,:,:) = z;
                    end
                end
            else
                n        = iterations;
                Z        = self.init_pdf(n);
                for i = 1:n
                    ind  = randperm( self.J );
                    z = self.get_test_stat( ind' );
                    if (self.Q==1) || (self.nEffects==1)
                        Z(i,:) = z;
                    else
                        Z(i,:,:) = z;
                    end
                end
            end
            self.Z         = squeeze( max(Z, [], 2) );
            if self.dim == 1
                self.ZZ    = Z;
            end
            self.nPermActual = size(Z, 1);
        end
        
        function [z] = get_test_stat(self, ind)
            if self.Q == 1
                z = self.calc.get_test_stat( self.Y(ind,:) );
            else
                z = self.calc.get_test_stat( self.Y(ind,:,:) );
            end
        end

    end
    
    methods (Access = private)
        function [Z] = init_pdf(self, n)
            if self.nEffects==1
                Z   = zeros(n, self.Q);
            else
                Z   = zeros(n, self.Q, self.nEffects);
            end
        end
    end
    
    
    
end



