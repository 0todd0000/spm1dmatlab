%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



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



