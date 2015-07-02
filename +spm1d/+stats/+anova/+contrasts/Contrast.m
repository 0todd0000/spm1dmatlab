


classdef Contrast
    properties
        C
        isrm
    end
    methods
        function self = Contrast(C)
            self.C    = C;
            self.isrm = false;
        end
        
        function plot(self, varargin)
            %parse inputs:
            parser = inputParser;
            addOptional(parser, 'ax',      gca, @(x)isa(x, 'matlab.graphics.axis.Axes'));
            parser.parse(varargin{:});
            ax     = parser.Results.ax;
%             imshow(self.C, [-1 1], 'initialmagnification','fit', 'parent',ax);
            imagesc(self.C, 'parent',ax);
            set(ax, 'clim',[-1 1])
            colormap('gray')
        end
       
       
   end
    
end