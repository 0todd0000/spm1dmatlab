%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPMi.m 1 2016-01-04 16:07 todd $



classdef SPMi < matlab.mixin.CustomDisplay & handle
    properties
        STAT        %test statistic ("T", "F", "X2" or "T2")
        two_tailed
        df          %degrees of freedom
        nNodes      %number of continuum nodes
        z           %test statistic continuum
        fwhm        %field smoothness (full width at half maximum)
        resels      %"resolution element" counts
        alpha       %type I error rate
        zstar       %critical test statistic threshold (at alpha)
        h0reject    %null hypothesis rejected?
        p_set       %set-level inference
        p           %cluster-level inference
        nClusters   %number of supra-threshold clusters
        clusters    %cluster objects
    end
    properties (Hidden)
        ax
        ax0
        centroids
        roi
    end
    
    
    methods
        
        function [self] = SPMi(spm, alpha, zstar, p_set, p, two_tailed, clusters)
            self.STAT         = spm.STAT;
            self.df           = spm.df;
            self.z            = spm.z;
            self.nNodes       = spm.nNodes;
            self.fwhm         = spm.fwhm;
            self.resels       = spm.resels;
            self.roi          = spm.roi;
            self.alpha        = alpha;
            self.zstar        = zstar;
            self.clusters     = clusters;
            if two_tailed
                self.h0reject = max( abs(self.z) ) > self.zstar;
            else
                self.h0reject = max(self.z) > self.zstar;
            end
            self.p_set        = p_set;
            self.p            = p;
            self.two_tailed   = two_tailed;
            self.nClusters    = numel(p);
        end
       
        function [varargout] = plot(self, varargin)
            parser = inputParser;
            addOptional(parser, 'ax', gca, @(x)isa(x, 'matlab.graphics.axis.Axes'));
            parser.parse(varargin{:});
            self.ax  = parser.Results.ax;
            self.ax0 = gca;
            self.set_axes()
            Q        = self.nNodes;
            zm       = self.z;
            %%% mask if ROI exists:
            if ~isempty(self.roi)
                zm(self.roi==0) = nan;
            end
            %%% plot:
            h3       = self.plot_cluster_patches();
            h0       = plot(0:Q-1, zm, 'k-', 'linewidth',3);  %SPM
            h1       = plot([0 Q-1], [0 0], 'k--');               %datum
            h2       = self.plot_threshold();
            %labels
            if isequal(self.STAT, 'T')
                stat_label = 't';
            else
                stat_label = self.STAT;
            end
            ylabel( sprintf('SPM %s %s %s', '\{', stat_label, '\}') )
            %tidy up:
            self.return2originalaxes()
            if nargout==1
                varargout = {[h0,h1,h2,h3]};
            end
        end
        
        
        function [h] = plot_p_values(self, varargin)
            parser = inputParser;
            addOptional(parser, 'offset', [0 0], @(x)isnumeric(x) & isvector(x) & numel(x)==2);
            parser.parse(varargin{:});
            offset = parser.Results.offset;
            self.set_axes()
            for i = 1:self.nClusters
                cluster = self.clusters{i};
                if cluster.iswrapped
                    h = self.plot_p_value_wrapped(cluster, offset);
                else
                    xy = cluster.xy;
                    h = text(xy(1)+offset(1), xy(2)+offset(2), self.p2str(cluster.P));
                end
            end
        end
        
        
        function [h] = plot_threshold_label(self, x, y)
            if nargin==1
                [x,y]  = deal(50, 0.9*self.zstar);
            end
            if isequal(self.STAT, 'T')
                stat_label = 't';
            else
                stat_label = self.STAT;
            end
            self.set_axes()
            s0  = texlabel( sprintf('alpha %s=%.02f', ' ', self.alpha)); 
            s1  = sprintf('%s* = %.3f', stat_label, self.zstar);
            h   = text(x, y, [s0 ',     ' s1], 'color','r');
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
        
        
        function [h] = plot_p_value_wrapped(self, cluster, offset)
            xy = cluster.other.xy;
            h = text(xy(1)+offset(1), xy(2)+offset(2), self.p2str(cluster.P));
        end
        
        function [h] = plot_threshold(self)
            Q        = self.nNodes;
            if isempty(self.roi)
                h        = plot([0 Q-1], self.zstar*[1 1], 'r:');
                if self.two_tailed
                    ha =  plot([0 Q-1], -self.zstar*[1 1], 'r:');
                    h  = [h ha];
                end
            else
                h      =  [];
                xx     = 0:Q-1;
                if islogical(self.roi)
                    zz = self.zstar * ones(1,Q);
                    zz(~self.roi) = nan;
                    h(numel(h)+1) = plot(xx, zz, 'r:', 'linewidth',2);
                    if self.two_tailed
                        h(numel(h)+1) = plot(xx, -zz, 'r:', 'linewidth',2);
                    end
                else  %directional ROI
                    if any(self.roi>0)
                        zz = self.zstar * ones(1,Q);
                        zz(self.roi<=0) = nan;
                        h(numel(h)+1)  = plot(xx, zz, 'r:', 'linewidth',2);
                    end
                    if any(self.roi<0)
                        zz = -self.zstar * ones(1,Q);
                        zz(self.roi>=0) = nan;
                        h(numel(h)+1) = plot(xx, zz, 'r:', 'linewidth',2);
                    end
                end
                
            end
            
        end
        
        
        function [h] = plot_cluster_patches(self)
            if self.nClusters==0
                h = {};
            else
                h = cell(1,self.nClusters);
                for i = 1:self.nClusters
                    h{i} = self.clusters{i}.plot_patch();
                end
                h = horzcat(h{:});
                set(h, 'FaceAlpha',0.5, 'EdgeColor','None')
            end
        end
    end
    
    
    
    
    methods (Access = protected)
        
        function header = getHeader(self)
            s = self.STAT;
            if s == 'T'
                s = 't';
            end
            header = sprintf('\nSPM{%s} inference',s);
        end
        
        function propgrp = getPropertyGroups(self)
            propList = struct(...
                'z', self.z,...
                'df', self.df,...
                'fwhm', self.fwhm,...
                'resels', self.resels,...
                'alpha', self.alpha,...
                'zstar', self.zstar,...
                'p_set', self.p_set,...
                'p', self.p);
         propgrp = matlab.mixin.util.PropertyGroup(propList);
        end
        
        function return2originalaxes(self)
            if ~isequal(self.ax, self.ax0)
                axes(self.ax0)
            end
            hold off
        end
        
        function set_axes(self)
            try
                axes(self.ax)
                hold on
            catch
                error('Must plot the SPM using plot() before using other plot commands.')
            end
        end
        

        
        
   end
        
   
    
end