


classdef SPMi < matlab.mixin.CustomDisplay & handle
    properties
        df
        nNodes
        z
        fwhm
        resels
        alpha
        zstar
        h0reject
        p
    end
    properties (Hidden)
        STAT
        two_tailed
        ax
        ax0
        centroids
        roi
    end
    
    
    methods
        
        function [self] = SPMi(spm, alpha, zstar, p, two_tailed)
            self.STAT         = spm.STAT;
            self.df           = spm.df;
            self.z            = spm.z;
            self.nNodes       = spm.nNodes;
            self.fwhm         = spm.fwhm;
            self.resels       = spm.resels;
            self.roi          = spm.roi;
            self.alpha        = alpha;
            self.zstar        = zstar;
            if two_tailed
                self.h0reject = abs( max(self.z) ) > self.zstar;
            else
                self.h0reject = max(self.z) > self.zstar;
            end
            self.p            = p;
            self.two_tailed   = two_tailed;
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
            self.roi
            %%% mask if ROI exists:
            if ~isempty(self.roi)
                zm(self.roi==0) = nan;
            end
            %%% plot:
            h0       = plot(0:Q-1, zm, 'k-', 'linewidth',3);  %SPM
            h1       = plot([0 Q-1], [0 0], 'k--');               %datum
            h2       = plot([0 Q-1], self.zstar*[1 1], 'r:');     %threshold
            if self.two_tailed
                h2a =  plot([0 Q-1], -self.zstar*[1 1], 'r:');   %lower threshold 
            end
            %fill suprathreshold clusters:
            h3      = self.plot_cluster_patches();
            %labels
            if isequal(self.STAT, 'T')
                stat_label = 't';
            else
                stat_label = self.STAT;
            end
            xlabel('Continuum position')
            ylabel( sprintf('SPM %s %s %s', '\{', stat_label, '\}') )
            %tidy up:
            self.return2originalaxes()
            if nargout==1
                if SPMi.two_tailed
                    varargout = {[h0,h1,h2,h2a,h3]};
                else
                    varargout = {[h0,h1,h2,h3]};
                end
            end
        end
        
        
        function [h] = plot_p_values(self, varargin)
            parser = inputParser;
            addOptional(parser, 'offset', [0 0], @(x)isnumeric(x) & isvector(x) & numel(x)==2);
            parser.parse(varargin{:});
            offset = parser.Results.offset;

            self.set_axes()
            for i = 1:numel(self.p)
                xy = self.centroids{i};
                h = text(xy(1)+offset(1), xy(2)+offset(2), sprintf('p = %.03f',self.p(i)));  %p value
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
        
                
        function [h] = plot_cluster_patches(self)
            [Q,y,thresh] = deal(self.nNodes, self.z, self.zstar);
            [x0,y0]  = deal( 1:Q, y );
            %find suprathreshold clusters
            if self.two_tailed
                [L0,n0]  = spm1d.geom.bwlabel(y > thresh);
                [L1,n1]  = spm1d.geom.bwlabel(y < -thresh);
                L1(L1>0) = L1(L1>0) + n0;
                L        = L0 + L1;
                n        = n0 + n1;
                csigns   = [ones(1,n0) -ones(1,n1)];
            else
                [L,n]    = spm1d.geom.bwlabel(y > thresh);
                csigns   = ones(1,n);
            end
            %plot suprathreshold cluster patches
            if n==0
                h   = -1;
                return
            end
            h       = zeros(1,n);
            self.centroids = cell(1,n);
            for i = 1:n
                csign      = csigns(i);
                [x,y]      = deal(x0(L==i), y0(L==i));
                [x,y]      = deal([x(1) x], [csign*thresh y]);
                %interpolate if necessary:
                if x(1)   ~= 1
                    dx     = 1;
                    dy     = (csign*thresh - y0(x(1))) / (y0(x(1)) - y0(x(1)-1)  );
                    x(1)   = x(1) + dy/dx;
                end
                if x(end) ~= Q
                    dx     = 1;
                    dy     = (csign*thresh - y0(x(end))) / (y0(x(end)+1) - y0(x(end))  );
                    x      = [x   x(end)+dy/dx]; %#ok<AGROW>
                    y      = [y  csign*thresh];  %#ok<AGROW>
                end
                [x,y]      = deal( [x x(end)], [y y(1)]);
                h(i)       = patch(x-1, y, 0.7*[1,1,1]);
                self.centroids{i} = [mean(x), mean(y)];
            end
            set(h, 'FaceAlpha',0.5, 'EdgeColor','None')
        end
    end
    
    
    
    
    methods (Access = protected)
        
        function header = getHeader(self)
            s = self.STAT;
            if s == 'T'
                s = 't';
            end
            header = sprintf('\nSPM{%s} (0D) inference',s);
        end
        
        function propgrp = getPropertyGroups(self)
            propList = struct(...
                'z', self.z,...
                'df', self.df,...
                'fwhm', self.fwhm,...
                'resels', self.resels,...
                'alpha', self.alpha,...
                'zstar', self.zstar,...
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