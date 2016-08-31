%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: Cluster.m 1 2016-01-04 16:07 todd $


classdef ClusterNP < spm1d.geom.Cluster
    properties
        metric
        metric_value
        metric_label
        iterations
        nPerm
        nPermUnique
    end
    
    methods
        
        function [self] = ClusterNP(X, Z, u, isinterp, mvalue, mlabel)
            self @ spm1d.geom.Cluster(X, Z, u, isinterp)
            self.isparam  = false;
        end
       
        function self = inference(self, pdf, two_tailed)
            p       = mean( pdf >= self.metric_value );
            p       = max(p, 1 / self.nPerm);
            self.P  = p;
        end
        
        function self = set_metric(self, metric, iterations, nPermUnique, two_tailed)
            self.iterations  = iterations;
            self.nPermUnique = nPermUnique;
            if self.iterations == -1
                self.nPerm   = nPermUnique;
            else
                self.nPerm   = iterations;
            end
            
            
            switch metric
            case 'MaxClusterExtent'
                self.metric   = spm1d.stats.nonparam.metrics.MaxClusterExtent();
            case 'MaxClusterHeight'
                self.metric   = spm1d.stats.nonparam.metrics.MaxClusterHeight();
            case 'MaxClusterIntegral'
                self.metric   = spm1d.stats.nonparam.metrics.MaxClusterIntegral();
            end
            
            self.metric_label  = self.metric.get_label_single();
            %compute metric value:
            x   = self.metric.get_single_cluster_metric_xz(self.X, self.Z, self.u, two_tailed);
            if self.iswrapped
                xx  = self.metric.get_single_cluster_metric_xz(self.other.X, self.other.Z, self.u, two_tailed);
                x   = x + xx;
            end
            self.metric_value  = max(x, eps);
        end
       

    end  %public methods
   
    
 

end



