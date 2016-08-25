function [ci] = ci_pairedsample(yA, yB, alpha, varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: ttest.m 1 2016-01-04 16:07 todd $

if nargin==3
    datum = 'difference';
    mu    = 0;
elseif nargin==4
    datum = varargin{1};
    if isequal(datum, 'difference')
        mu = 0;
        muvalue = 0;
    elseif isequal(datum, 'meanA')
        mu = 'meanB';
        muvalue = 0;
    end
elseif nargin==5
    datum = varargin{1};
    mu    = varargin{2};
    muvalue = 0;
end
    

% %parse varargin
% parser = inputParser;
% addOptional(parser, 'datum', 'difference', @(x)( ischar(x) && ismember(x, {'difference','meanA'}) )  );
% addOptional(parser, 'mu', 0, @(x)( isnumeric(x) || ismember(x, {'meanB','tailB'}) )  );
% parser.parse(varargin{:});
% datum  = parser.Results.datum;
% mu     = parser.Results.mu;
% if isequal(datum, 'difference')
%     muvalue = mu;
% elseif isequal(datum, 'meanA')
%     if mu
%     criterion = mu;
% else
%     muvalue = 0;
% end


spmi    = spm1d.stats.ttest(yA - yB, muvalue).inference(alpha, 'two_tailed',true);
[mA,mB] = deal( mean(yA, 1), mean(yB, 1) );     %sample means
s       = spmi.sigma2 ^ 0.5;     %sample standard deviation (pooled)
hstar   = spmi.zstar * s / size(yA,1)^0.5;

if isequal(datum, 'difference')
    ci    = spm1d.stats.ci.CIPairedDifference0D(spmi, mA-mB, hstar, muvalue);
else
    ci    = spm1d.stats.ci.CIPairedSample0D(spmi, mA, mB, hstar, mu);
end


