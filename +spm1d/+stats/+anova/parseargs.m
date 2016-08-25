function [parser] = parseargs(varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: anova1rm.m 1 2016-01-04 16:07 todd $

parser   = inputParser;
addOptional(parser, 'roi',       [], @(x)isempty(x) || ((islogical(x)|| isnumeric(x)) && isvector(x))   );
addOptional(parser, 'force_approx0D',       false, @(x)islogical(x) && isscalar(x)   );
parser.parse(varargin{:});

    