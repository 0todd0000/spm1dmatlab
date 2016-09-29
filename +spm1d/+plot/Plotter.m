%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: plot_meanSD.m 1 2016-01-04 16:07 todd $



classdef Plotter
    properties
        ax
        ax0
    end
    
    
    methods
        function [self] = Plotter(varargin)
            parser     = inputParser;
            addOptional(parser, 'ax',      gca, @(x)isa(x, 'matlab.graphics.axis.Axes'));
            parser.parse(varargin{:});
            self.ax    = parser.Results.ax;;
            self       = self.set_axes();
        end


        function [hh] = plot_p_values(self, spmi, varargin)
            parser = inputParser;
            addOptional(parser, 'offset', [0 0], @(x)isnumeric(x) & isvector(x) & numel(x)==2);
            parser.parse(varargin{:});
            offset = parser.Results.offset;
            hh     = zeros(1, spmi.nClusters);
            for i = 1:spmi.nClusters
                cluster = spmi.clusters{i};
                if cluster.iswrapped
                    h  = self.plot_p_value_wrapped(cluster, offset);
                else
                    xy = cluster.xy;
                    h  = text(xy(1)+offset(1), xy(2)+offset(2), self.p2str(cluster.P));
                end
                hh(i)  = h;
            end
            set(hh, 'HorizontalAlignment','center', 'BackgroundColor', 0.95*[1 1 1])
            hh = num2cell(hh);
        end
        
        
        function [varargout] = plot_spm(self, spm, varargin)
            parser     = inputParser;
            addOptional(parser, 'linewidth',     3,  @(x)(isnumeric(x) && isscalar(x))  );
            addOptional(parser, 'color',        'k', @(x)(isnumeric(x) && isscalar(x))  );
            parser.parse(varargin{:});
            linewidth  = parser.Results.linewidth;;
            color      = parser.Results.color;;
            h          = plot(spm.z, 'linewidth',linewidth, 'color',color);
            hy         = self.plot_ylabel(spm);
            self.return2originalaxes()
            varargout  = {h};
        end
        
        
        function [varargout] = plot_spmi(self, spmi, varargin)
            Q        = spmi.nNodes;
            zm       = spmi.z;
            %%% mask if ROI exists:
            if ~isempty(spmi.roi)
                zm(spmi.roi==0) = nan;
            end
            %%% plot:
            h3       = self.plot_cluster_patches(spmi);
            h0       = plot(0:Q-1, zm, 'k-', 'linewidth',3);  %SPM
            h1       = plot([0 Q-1], [0 0], 'k:');               %datum
            h2       = self.plot_threshold(spmi);
            hy       = self.plot_ylabel(spmi);
            %tidy up:
            self.return2originalaxes()
            varargout = {h0,h1,h2,h3};
        end
        
        
        function [h] = plot_threshold_label(self, spmi, varargin)
            if nargin==2
                [x,y]  = deal(50, 0.97*spmi.zstar);
            end
            if isequal(spmi.STAT, 'T')
                stat_label = 't';
            else
                stat_label = spmi.STAT;
            end
            s0  = texlabel( sprintf('alpha %s=%.02f', ' ', spmi.alpha)); 
            s1  = sprintf('%s* = %.3f', stat_label, spmi.zstar);
            h   = text(x, y, [s0 ',     ' s1], 'color','r');
            set(h, 'HorizontalAlignment','center', 'BackgroundColor', 0.95*[1 1 1])
            self.return2originalaxes()
        end
        
        
        

    end
   
   
    methods (Access=private)
        
        function [s] = p2str(~, p)
            if p<0.0005
                s = 'p < 0.001';
            else
                s = sprintf('p = %.03f',p);
            end
        end
        
        
        function [h] = plot_cluster_patches(self, spmi)
            if spmi.nClusters==0
                h = {};
            else
                h = cell(1, spmi.nClusters);
                for i = 1:spmi.nClusters
                    h{i} = spmi.clusters{i}.plot_patch();
                end
                h = horzcat(h{:});
                set(h, 'FaceAlpha',0.5, 'EdgeColor','None')
            end
        end
        
        
        function [h] = plot_p_value_wrapped(self, cluster, offset)
            xy = cluster.other.xy;
            h = text(xy(1)+offset(1), xy(2)+offset(2), self.p2str(cluster.P));
        end
        
        
        function [h] = plot_threshold(self, spmi)
            Q        = spmi.nNodes;
            if isempty(spmi.roi)
                h        = plot([0 Q-1], spmi.zstar*[1 1], 'r--');
                if spmi.two_tailed
                    ha =  plot([0 Q-1], -spmi.zstar*[1 1], 'r--');
                    h  = [h ha];
                end
            else
                h      =  [];
                xx     = 0:Q-1;
                if islogical(spmi.roi)
                    zz = spmi.zstar * ones(1,Q);
                    zz(~spmi.roi) = nan;
                    h(numel(h)+1) = plot(xx, zz, 'r:', 'linewidth',2);
                    if spmi.two_tailed
                        h(numel(h)+1) = plot(xx, -zz, 'r:', 'linewidth',2);
                    end
                else  %directional ROI
                    if any(spmi.roi>0)
                        zz = spmi.zstar * ones(1,Q);
                        zz(spmi.roi<=0) = nan;
                        h(numel(h)+1)  = plot(xx, zz, 'r:', 'linewidth',2);
                    end
                    if any(spmi.roi<0)
                        zz = -spmi.zstar * ones(1,Q);
                        zz(spmi.roi>=0) = nan;
                        h(numel(h)+1) = plot(xx, zz, 'r:', 'linewidth',2);
                    end
                end
                
            end
        end
        
        
        function [h] = plot_ylabel(self, spm)
            if spm.isparametric
                spmstring = 'SPM';
            else
                spmstring = 'SnPM';
            end
            if isequal(spm.STAT, 'T')
                stat_label = 't';
            else
                stat_label = spm.STAT;
            end
            s   = sprintf('%s %s %s %s', spmstring, '\{', stat_label, '\}');
            h   = ylabel(s);
        end


    end
   
   
   
    methods (Access = protected)
        function header = getHeader(self)
            s = self.STAT;
            if s == 'T'
                s = 't';
            end
            header = sprintf('\nSnPM{%s} inference (1D)',s);
        end
        
        function propgrp = getPropertyGroups(self)
            propList = struct;
            propList.z           = self.z;
            propList.nPermUnique = self.nPermUnique;
            propList.alpha       = self.alpha;
            propList.zstar       = self.zstar;
            propList.nClusters   = self.nClusters;
            propList.two_tailed  = self.two_tailed;
            propList.h0reject    = self.h0reject;

            propgrp = matlab.mixin.util.PropertyGroup(propList);
        end
        
        
        function return2originalaxes(self)
            hold off
            axes( self.ax0 )
        end
        
        
        function [self] = set_axes(self)
            self.ax0   = gca;
            try
                axes(self.ax)
                hold on
            catch
                error('Must plot the SPM using plot() before using other plot commands.')
            end
        end
    end
   
   

    
end