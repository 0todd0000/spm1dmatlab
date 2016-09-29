%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef ASnPM1D < spm1d.stats.nonparam.snpm.ASnPM
    properties
        roi
    end
    
    methods
        
        function [self] = ASnPM1D(z, perm, varargin)
            %parse varargin
            parser = inputParser;
            addOptional(parser, 'isinlist',   false, @islogical);
            parser.parse(varargin{:});
            isinlist         = parser.Results.isinlist;
            self@spm1d.stats.nonparam.snpm.ASnPM(z, perm, isinlist)
            if isinlist
                nPermUnique  = -1;
            else
                nPermUnique  = perm.nPermTotal;
            end
            %set attributes:
            self.dim         = 1;
            self.Q           = numel(z);
            self.z           = z;
            self.permuter    = perm;
            self.nPermUnique = nPermUnique;
            self.isinlist    = isinlist;
       end
       
       function snpmi = inference(self, alpha, varargin)
           % parse varargin
           parser           = inputParser;
           addOptional(parser, 'two_tailed',  false, @islogical);
           addOptional(parser, 'iterations',  -1, @isscalar);
           addOptional(parser, 'force_iterations',  false, @islogical);
           addOptional(parser, 'interp',  true, @islogical);
           addOptional(parser, 'circular',  false, @islogical);
           addOptional(parser, 'cluster_metric',  'MaxClusterIntegral', @(x)ismember(x, {'MaxClusterExtent', 'MaxClusterHeight', 'MaxClusterIntegral'}));
           parser.parse(varargin{:});
           two_tailed       = parser.Results.two_tailed;
           interp           = parser.Results.interp;
           circular         = parser.Results.circular;
           iterations       = parser.Results.iterations;
           force_iterations = parser.Results.force_iterations;
           cluster_metric   = parser.Results.cluster_metric;
           self.permuter.check_iterations(alpha, iterations, force_iterations)
           if two_tailed && ~isequal(self.STAT, 'T')
               error('Two-tailed inference is only possible with the T statistic (univariate t tests and regression). Set "two_tailed" to false or remove the "two_tailed" keyword from the function call.')
           end
           % build PDF:
           self.permuter    = self.permuter.build_pdf(iterations);
           % compute critical threshold and probability value
           zstar            = self.permuter.get_z_critical(alpha, 'two_tailed', two_tailed);
           zstar            = max(zstar);
           % build secondary PDF:
           self.permuter    = self.permuter.set_metric( cluster_metric );
           self.permuter    = self.permuter.build_secondary_pdf(zstar, circular);
           % assemble clusters:
           clusters         = self.get_clusters(zstar, two_tailed, interp, circular, iterations, cluster_metric);
           clusters         = self.cluster_inference(clusters, two_tailed);
           %return an SnPM object:
           if self.STAT=='F'
               snpmi = spm1d.stats.nonparam.snpm.SnPM1DiF(self, alpha, zstar, clusters);
           else
               snpmi = spm1d.stats.nonparam.snpm.SnPM1Di(self, alpha, zstar, two_tailed, clusters);
           end
       end
       
       
       function [varargout] = plot(self, varargin)
           plotter   = spm1d.plot.Plotter(varargin{:});
           h         = plotter.plot_spm(self);
           varargout = {h};
       end
       
       
        function [clusters] = get_clusters(self, zstar, two_tailed, interp, circular, iterations, cluster_metric)
            clusters = spm1d.geom.cluster_geom(self.z, zstar, interp, circular, 'csign',+1, 'nonparam',true);
            if two_tailed
                clustersn = spm1d.geom.cluster_geom(-self.z, zstar, interp, circular, 'csign',-1, 'nonparam',true);
                clusters  = [clusters clustersn];
            end
            for i = 1:numel(clusters)
                clusters{i} = clusters{i}.set_metric(cluster_metric, iterations, self.nPermUnique, two_tailed);
            end
            if two_tailed
                clusters  = self.reorder_clusters(clusters);
            end
        end
        
        
        function [clusters] = cluster_inference(self, clusters, two_tailed)
            for i = 1:numel(clusters)
                clusters{i} = clusters{i}.inference(self.permuter.Z2, two_tailed);
            end
        end
       

    end
    
    
    
    
    methods (Access = protected)
        function header = getHeader(self)
            s = self.STAT;
            if s == 'T'
                s = 't';
            end
            header = sprintf('\nSnPM{%s} (1D)',s);
        end
        
        function propgrp = getPropertyGroups(self)
            plist = struct;
            plist.z           = self.z;
            plist.nPermUnique = self.nPermUnique;
            propgrp = matlab.mixin.util.PropertyGroup(plist);
        end
        
        
        function [clusters] = reorder_clusters(self, clusters) %#ok<INUSL>
            n = numel(clusters);
            if n > 0
                x = zeros(1, n);
                for i = 1:n
                    if iscell(clusters{i}.xy)
                        x(i) = clusters{i}.xy{1}(1);
                    else
                        x(i) = clusters{i}.xy(1);
                    end
                end
                [~,ind]      = sort(x);
                clusters     = clusters(ind);
            end
        end



   end



end