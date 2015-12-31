function [h0,h1] = plot_meanSD(Y)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: plot_meanSD.m 1 2016-01-04 16:07 todd $


[y,ys]    = deal(mean(Y,1), std(Y,1));       
x         = 0:numel(y)-1;
h0        = plot(x, y, 'k-', 'linewidth', 2);
h1        = spm1d.plot.plot_errorcloud(y, ys);
