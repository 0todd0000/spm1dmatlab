function [parser] = parseargs(varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky


parser   = inputParser;
addOptional(parser, 'roi',       [], @(x)isempty(x) || ((islogical(x)|| isnumeric(x)) && isvector(x))   );
addOptional(parser, 'force_approx0D',       false, @(x)islogical(x) && isscalar(x)   );
parser.parse(varargin{:});

    