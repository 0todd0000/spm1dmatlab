function [SPM] = hotellings(Y, mu, varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



parser = inputParser;
addOptional(parser, 'roi',       [], @(x)isempty(x) || ((islogical(x)|| isnumeric(x)) && isvector(x))   );
parser.parse(varargin{:});
roi          = parser.Results.roi;


if ismatrix(Y)
    [J,I]   = size(Y);
    if nargin==1
        mu = zeros(1,I);
    end
    y       = Y - repmat(mu(:)', J, 1);
    [T2]    = here_hotellings_single_node(y);
    df      = [I J-1];
    SPM     = spm1d.stats.spm.SPM0D('T2', T2, df);
else
    [J,Q,I] = size(Y);
    if nargin==2
        Y   = Y - mu;
    end
    T2      = zeros(1, Q);
    for q = 1:Q
        T2(q) = here_hotellings_single_node( squeeze(Y(:,q,:)) );
    end
    df      = [I J-1];
    R       = here_get_residuals(Y);
    fwhm    = spm1d.geom.fwhmmv(R);
    if isempty(roi)
        resels   = spm1d.geom.resels(R, fwhm);
    else
        B    = any(isnan(any(isnan(R), 1)), 3);
        B    = ~B & roi;
        resels   = spm1d.geom.resels(B, fwhm);
    end
    SPM     = spm1d.stats.spm.SPM('T2', T2, df, fwhm, resels, 'roi', roi);
end
end






function [T2] = here_hotellings_single_node(y)
    J       = size(y,1);
    m       = mean(y);      %mean vector
    W       = cov(y);       %covariance
    T2      = J * m * (W \ m');
end


function [R] = here_get_residuals(Y)
[J,~,~]    = size(Y);
m          = mean(Y, 1);
R          = Y - repmat(m, [J 1 1]);
end


