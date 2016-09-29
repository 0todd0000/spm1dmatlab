%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef (Abstract) AMetric
    methods (Abstract)
        [x] = get_single_cluster_metric(self, z, u, L);
        [x] = get_single_cluster_metric_xz(self, x, z, u, two_tailed);
    end
    
    
    methods
        
        function [s] = get_label(self)
            s = strsplit( class(self), '.');
            s = s{end};
        end
        
        function [s] = get_label_single(self)
            s = self.get_label();
            if isequal( s(1:3), 'Max' );
                s = s(4:end);
            end
        end
        
        
        function [x] = get_all_cluster_metrics(self, z, u, circular)
            [L,n]  = spm1d.geom.bwlabel( z > u);
            if n==0
                x = 0;
            else
                x      = zeros(1,n);
                for i=1:n
                    x(i) = self.get_single_cluster_metric(z, u, L==i);
                end
            end
        end
        
        
        function [x] = get_max_metric(self, z, u, circular)
            x = max( self.get_all_cluster_metrics(z, u, circular) );
        end


    end
end