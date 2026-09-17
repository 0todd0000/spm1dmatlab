%__________________________________________________________________________
% Copyright (C) Copyright (C) 2026  Todd Pataky Todd Pataky



classdef MaxClusterExtent < spm1d.stats.nonparam_old.metrics.AMetric

    methods

        function [x] = get_single_cluster_metric(self, z, u, L)
            x = sum(L);
        end

        function [x] = get_single_cluster_metric_xz(self, x, z, u, two_tailed)
            x = max(x) - min(x);
        end

    end
end