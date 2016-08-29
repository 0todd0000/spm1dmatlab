%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM.m 2 2016-03-30 17:01 todd $


classdef (Abstract) APermuter1D < spm1d.stats.nonparam.permuters.APermuter
    properties
        ZZ           %all permutation test statistic continua
        Z2           %secondary perumtation PDF
        metric       %cluster metric calculator
    end

    methods
        function [self] = APermuter1D()
            self.dim  = 1;
        end
        
        function [p] = get_p_value(self, z, zstar, alpha, varargin)
            p = nan;
            % %parse varargin
            % parser     = inputParser;
            % addOptional(parser, 'Z', self.Z, @isnumeric);
            % parser.parse(varargin{:});
            % Z          = parser.Results.Z;
            % %compute p value
            % two_tailed = numel(zstar) == 2;
            % if two_tailed
            %     if z > 0
            %         p  = 2 * mean( Z > z );
            %     else
            %         p  = 2 * mean( Z < z );
            %     end
            % else
            %     p      = mean( Z > z );
            % end
            % %set minimum and maximum p values:
            % self.minp  = 1 / numel(Z);
            % self.maxp  = 1 - self.minp;
            % %adjust the p value to alpha if (z > z*) but (p > alpha)
            % if two_tailed
            %     [zc0,zc1]  = deal(zstar(1), zstar(2));
            % else
            %     [zc0,zc1]  = deal(-inf, zstar);
            % end
            % if ((z > zc1) && (p > alpha)) || ((z < zc0) && (p > alpha))
            %     p          = alpha;
            % end
            % %substitute with min/max p value if applicable
            % p              = min( max(p, self.minp), self.maxp );
        end
        
        function [self] = build_secondary_pdf(self, zstar, circular)
            [nIterations,Q]  = size(self.ZZ);
            Z2  = zeros(nIterations,1);
            for i = 1:nIterations
                Z2(i) = self.metric.get_max_metric( self.ZZ(i,:), zstar, circular );
            end
            self.Z2  = Z2;
        end
        
        
        function [self] = set_metric(self, metric)
            switch metric
            case 'MaxClusterExtent'
                self.metric   = spm1d.stats.nonparam.metrics.MaxClusterExtent();
            case 'MaxClusterHeight'
                self.metric   = spm1d.stats.nonparam.metrics.MaxClusterHeight();
            case 'MaxClusterIntegral'
                self.metric   = spm1d.stats.nonparam.metrics.MaxClusterIntegral();
            end
        end
        

    end
end



