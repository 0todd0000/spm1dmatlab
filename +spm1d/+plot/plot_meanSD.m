function [h0,h1] = plot_meanSD(Y)

% Copyright (C) 2014  Todd Pataky
% Version: M0.1 (2014/05/01)

[y,ys]    = deal(mean(Y,1), std(Y,1));       
x         = 0:numel(y)-1;
h0        = plot(x, y, 'k-', 'linewidth', 2);
h1        = spm1d.plot.plot_errorcloud(y, ys);
