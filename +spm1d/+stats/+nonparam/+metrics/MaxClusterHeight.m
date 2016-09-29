%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef MaxClusterHeight < spm1d.stats.nonparam.metrics.AMetric

    methods

        function [x] = get_single_cluster_metric(self, z, u, L)
            x = max( z(L) );
        end

        function [x] = get_single_cluster_metric_xz(self, x, z, u, two_tailed)
            x = max(z);
        end

    end
end