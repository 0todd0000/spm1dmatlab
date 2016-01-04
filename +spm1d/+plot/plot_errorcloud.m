function [h] = plot_errorcloud(y, ye, varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: plot_errorcloud.m 1 2016-01-04 16:07 todd $

%parse inputs
parser         = inputParser;
addOptional(parser, 'facecolor', 'k');
addOptional(parser, 'facealpha', 0.5, @(x) isscalar(x) && (x>=0) && (x<=1) );
parser.parse(varargin{:});
facecolor      = parser.Results.facecolor;
facealpha      = parser.Results.facealpha;


x         = 0:numel(y)-1;
[y0,y1]   = deal(y+ye, y-ye);
[x,y0,y1] = deal( [x(1) x x(end)], [y0(1) y0 y0(end)], [y1(1) y1 y1(end)]);
[x1,y1]   = deal(fliplr(x), fliplr(y1));
[X,Y]     = deal([x x1], [y0 y1]);
h         = patch(X, Y, 0.7*[1,1,1]);
set(h, 'FaceColor',facecolor, 'FaceAlpha',facealpha, 'EdgeColor','None')
