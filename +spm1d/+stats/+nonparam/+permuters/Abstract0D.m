%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM.m 2 2016-03-30 17:01 todd $


classdef (Abstract) Abstract0D < spm1d.stats.nonparam.permuters.AbstractBase
    methods
        function [self] = Abstract0D()
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
            %substitute with minimum p value if applicable
            minp       = 1 / numel(Z);
            if two_tailed
                [zc0,zc1]  = deal(zstar(1), zstar(2));
                if (z < 0) && (z < zc0 ) && (p > alpha)
                    p  = minp;
                elseif (z > 0) && (z > zc1 ) && (p > alpha)
                    p  = minp;
                end
            elseif (z > 0) && (z > zstar) && (p > alpha)
                p      = minp;
            end
        end

        
    end
end



