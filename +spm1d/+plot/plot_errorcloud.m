function [h] = plot_errorcloud(y, ye, x)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: plot_errorcloud.m 1 2016-01-04 16:07 todd $

Q         = numel(y);
if nargin==2
    x         = 0:Q-1;
end
[y0,y1]   = deal(y+ye, y-ye);
[x,y0,y1] = deal( [x(1) x x(end)], [y0(1) y0 y0(end)], [y1(1) y1 y1(end)]);
[x1,y1]   = deal(fliplr(x), fliplr(y1));
[X,Y]     = deal([x x1], [y0 y1]);
h         = patch(X, Y, 0.7*[1,1,1]);
set(h, 'FaceAlpha',0.5, 'EdgeColor','None')
