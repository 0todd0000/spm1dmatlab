%__________________________________________________________________________
% Copyright (C) 2025 Todd Pataky



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
        
 
        function [self] = build_secondary_pdf(self, zstar, circular)
            nIterations = size(self.ZZ, 1);
            self.Z2  = zeros(nIterations,1);
            for i = 1:nIterations
                self.Z2(i) = self.metric.get_max_metric( self.ZZ(i,:), zstar, circular );
            end
        end
        
        
        function [zstar] = get_z_critical(self, alpha, varargin)
            %parse varargin
            parser      = inputParser;
            addOptional(parser, 'two_tailed', false, @islogical);
            parser.parse(varargin{:});
            two_tailed  = parser.Results.two_tailed;
            %compute critical threshold
            if two_tailed
                % perc    = [100*0.5*alpha   100*(1 - 0.5*alpha)];
                perc    = 100*(1 - alpha);
                zstar   = spm1d.util.percentile( abs(self.Z), perc);
            else
                perc    = 100*(1 - alpha);
                zstar   = spm1d.util.percentile(self.Z, perc);
            end
            
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



