%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef MaxClusterIntegral < spm1d.stats.nonparam.metrics.AMetric

    methods

        function [x] = get_single_cluster_metric(self, z, u, L)
            if sum(L)==1
                x = z(L) - u;
            else
                x = trapz( z(L) - u );
            end
        end

        function [m] = get_single_cluster_metric_xz(self, x, z, u, two_tailed)
            m = 0;
            if numel(x)==1
                m = z - u;
            else
                m = trapz( z - u );
            end
            if two_tailed && (m < 0)
                m = -m;
            end
        end

    end
end