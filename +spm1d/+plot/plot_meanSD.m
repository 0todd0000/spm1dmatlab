function [h0,h1] = plot_meanSD(Y, varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: plot_meanSD.m 1 2016-01-04 16:07 todd $


%parse inputs
parser         = inputParser;
addOptional(parser, 'color', 'k');
addOptional(parser, 'linewidth', 2, @(x) isscalar(x));
addOptional(parser, 'facealpha', 0.25, @(x) isscalar && (x>=0) && (x<=1) );
parser.parse(varargin{:});
color          = parser.Results.color;
linewidth      = parser.Results.linewidth;
facealpha      = parser.Results.facealpha;




[y,ys]    = deal(mean(Y,1), std(Y,1));       
x         = 0:numel(y)-1;
h0        = plot(x, y, 'color',color, 'linewidth',linewidth);
h1        = spm1d.plot.plot_errorcloud(y, ys, 'facecolor',color, 'facealpha',facealpha);
