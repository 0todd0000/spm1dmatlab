%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef (Abstract) APermuter0D < spm1d.stats.nonparam.permuters.APermuter

    methods
        function [self] = APermuter0D()
            self.dim  = 0;
        end
        
        function [p] = get_p_value(self, z, zstar, alpha, varargin)
            %parse varargin
            parser     = inputParser;
            addOptional(parser, 'Z', self.Z, @isnumeric);
            parser.parse(varargin{:});
            Z          = parser.Results.Z;
            %compute p value
            two_tailed = numel(zstar) == 2;
            if two_tailed
                if z > 0
                    p  = 2 * mean( Z > z );
                else
                    p  = 2 * mean( Z < z );
                end
            else
                p      = mean( Z > z );
            end
            %set minimum and maximum p values:
            self.minp  = 1 / numel(Z);
            self.maxp  = 1 - self.minp;
            %adjust the p value to alpha if (z > z*) but (p > alpha)
            if two_tailed
                [zc0,zc1]  = deal(zstar(1), zstar(2));
            else
                [zc0,zc1]  = deal(-inf, zstar);
            end
            if ((z > zc1) && (p > alpha)) || ((z < zc0) && (p > alpha)) 
                p          = alpha;
            end
            %substitute with min/max p value if applicable
            p              = min( max(p, self.minp), self.maxp );
        end

    end
end



