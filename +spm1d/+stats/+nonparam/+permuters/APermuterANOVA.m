%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM.m 2 2016-03-30 17:01 todd $


classdef (Abstract) APermuterANOVA < spm1d.stats.nonparam.permuters.APermuter
    properties
        J
        A
        B
        C
        SUBJ
        nEffects = 1;
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
        end

        function [self] = build_pdf(self, iterations)
            if iterations==-1
                n        = self.nPermTotal;
                Z        = zeros(n, self.nEffects);
                IND      = perms( 1:self.J );
                for i = 1:n
                    Z(i,:) = self.get_test_stat( IND(i,:)' );
                end
            else
                n        = iterations;
                Z        = zeros(n, self.nEffects);
                for i = 1:n
                    ind  = randperm( self.J );
                    Z(i,:) = self.get_test_stat( ind' );
                end
            end
            self.Z   = Z;
        end
        
        function [z] = get_test_stat(self, ind)
            z = self.calc.get_test_stat( self.Y(ind,:) );
        end

    end
end



