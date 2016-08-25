function [ci] = ci_onesample(y, alpha, varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: ttest.m 1 2016-01-04 16:07 todd $


%parse varargin
parser = inputParser;
addOptional(parser, 'mu', 0, @isnumeric);
parser.parse(varargin{:});
mu     = parser.Results.mu;


spmi  = spm1d.stats.ttest(y, mu).inference(alpha, 'two_tailed',true);
mn    = spmi.beta;            %sample mean
s     = spmi.sigma2 ^ 0.5;    %sample standard deviation
hstar = spmi.zstar * s / size(y,1)^0.5;
ci    = spm1d.stats.ci.CIOneSample0D(spmi, mn, hstar, mu);