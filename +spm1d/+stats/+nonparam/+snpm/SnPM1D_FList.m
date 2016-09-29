%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef SnPM1D_FList < spm1d.stats.nonparam.snpm.ASnPMFList

    methods
        function [self] = SnPM1D_FList(SnPMs, perm, varargin)
            self @ spm1d.stats.nonparam.snpm.ASnPMFList(SnPMs, perm, varargin)
            self.dim  = 1;
        end
        
        
        function snpmilist    = inference(self, alpha, varargin)
             %parse varargin
            parser           = inputParser;
            addOptional(parser, 'iterations',  -1, @isscalar);
            addOptional(parser, 'force_iterations',  false, @islogical);
            addOptional(parser, 'interp',  true, @islogical);
            addOptional(parser, 'circular',  false, @islogical);
            addOptional(parser, 'cluster_metric',  'MaxClusterIntegral', @(x)ismember(x, {'MaxClusterExtent', 'MaxClusterHeight', 'MaxClusterIntegral'}));

            parser.parse(varargin{:});
            interp           = parser.Results.interp;
            circular         = parser.Results.circular;
            iterations       = parser.Results.iterations;
            force_iterations = parser.Results.force_iterations;
            cluster_metric   = parser.Results.cluster_metric;
            self.permuter.check_iterations(alpha, iterations, force_iterations)
             
            %build primary PDF:
            self.permuter = self.permuter.build_pdf(iterations);
            %compute critical thresholds:
            zzstar = self.permuter.get_z_critical_list(alpha);
             
            % build secondary PDFs:
            self.permuter    = self.permuter.set_metric( cluster_metric );
            self.permuter    = self.permuter.build_secondary_pdfs(zzstar, circular);
            
            
            two_tailed       = false;
            SnPMs            = cell(1, self.nEffects);
            for i = 1:self.nEffects
                snpm         = self.SPMs{i};
                clusters     = snpm.get_clusters(zzstar(i), two_tailed, interp, circular, iterations, cluster_metric);  % supra-threshold clusters
                clusters     = snpm.cluster_inference(clusters, two_tailed);
                SnPMs{i}     = spm1d.stats.nonparam.snpm.SnPM1DiF(snpm, alpha, zzstar(i), clusters);
            end

             snpmilist = spm1d.stats.nonparam.snpm.SnPM1D_FiList(SnPMs, self.permuter);
             snpmilist = spm1d.stats.anova.set_labels(snpmilist, self.permuter.calc.design);
         end
         
         
         function [z] = get_test_stats(self)
             % f = self.SnPMS{1};
             Q = self.permuter.Q;
             z = zeros(self.nEffects, Q);
             for i = 1:self.nEffects
                 z(i,:) = self.SPMs{i}.z;
             end
         end
         

        
        function [self] = plot(self, varargin)
            parser        = inputParser;
            addParameter(parser, 'FigureName', '', @ischar);
            addParameter(parser, 'autoset_ylim', true, @islogical);
            parser.parse(varargin{:});
            figurename    = parser.Results.FigureName;
            autoset_ylim  = parser.Results.autoset_ylim;
            figure('name', figurename)
            if self.nEffects <= 4
                m = 2;
            else
                m = 3;
            end
            myylim = zeros(self.nEffects,2);
            axx    = zeros(self.nEffects,1);
            for k = 1:self.nEffects
                ax  = subplot(m, m, k);
                spm = self.SPMs{k};
                spm.plot();
                title( spm.effect )
                xlim([0 self.Q])
                myylim(k,:) = get(ax, 'ylim');
                axx(k) = ax;
            end
            if autoset_ylim
                set(axx, 'ylim', [ min(myylim(:,1))  max(myylim(:,2)) ] )
            end

        end
        
        
    end


end