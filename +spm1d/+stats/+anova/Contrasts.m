%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky




classdef Contrasts
    properties
        C
        term_labels
    end
    methods
        function self = Contrasts(C, term_labels)
            self.C    = C;
            self.term_labels = term_labels;
        end
        
        function plot(self, varargin)
            parser = inputParser;
            addOptional(parser, 'ax',      gca, @(x)isa(x, 'matlab.graphics.axis.Axes'));
            parser.parse(varargin{:});
            ax     = parser.Results.ax;
            imagesc(self.C, 'parent',ax);
            set(ax, 'clim',[-1 1])
            colormap('gray')
        end
       
   end
    
end