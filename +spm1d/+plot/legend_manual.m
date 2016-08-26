function [h] = legend_manual(labels, varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: plot_errorcloud.m 1 2016-01-04 16:07 todd $

%parse inputs
parser         = inputParser;
addOptional(parser, 'colors', 'k');
addOptional(parser, 'linestyles', '-');
addOptional(parser, 'linewidths', 3);
addOptional(parser, 'location', 'northeast');
parser.parse(varargin{:});
colors         = parser.Results.colors;
linewidths     = parser.Results.linewidths;
linestyles     = parser.Results.linestyles;
location       = parser.Results.location;


n = numel(labels);

if ~iscell(linestyles)
    linestyles = repmat({linestyles}, [1 n]);
end

ax             = gca;
hold0          = ishold(ax);
[xlim0,ylim0]  = deal( get(ax, 'xlim'), get(ax, 'ylim') );


n = numel(labels);
hold on
hh = zeros(n,1);
for i = 1:n
    [s,c,lw,ls] = deal(labels{i}, colors{i}, linewidths(i), linestyles{i});
    h = plot([0 0], [0 0], 'color',c, 'linewidth',lw, 'linestyle',ls, 'DisplayName',s);
    hh(i) = h;
end
    

legend(hh, 'location',location)

xlim(xlim0)
ylim(ylim0)

if ~hold0
    hold off
end
    
