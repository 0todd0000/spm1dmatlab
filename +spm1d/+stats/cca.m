function [SPM] = cca(Y, x, varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



parser = inputParser;
addOptional(parser, 'roi',       [], @(x)isempty(x) || ((islogical(x)|| isnumeric(x)) && isvector(x))   );
parser.parse(varargin{:});
roi          = parser.Results.roi;


if ismatrix(Y)
    [x2,df]    = cca_single_node(Y, x);
    SPM        = spm1d.stats.spm.SPM0D('X2', x2, df);
else
    [J,Q,I]    = size(Y);
    X2         = zeros(1, Q);
    for q = 1:Q
        [x2,df] = cca_single_node( squeeze(Y(:,q,:)), x);
        X2(q) = x2;
    end
    R          = here_get_residuals(Y, x);
    fwhm       = spm1d.geom.fwhmmv(R);
    if isempty(roi)
        resels   = spm1d.geom.resels(R, fwhm);
    else
        B    = any(isnan(any(isnan(R), 1)), 3);
        B    = ~B & roi;
        resels   = spm1d.geom.resels(B, fwhm);
    end
    SPM        = spm1d.stats.spm.SPM('X2', X2, df, fwhm, resels, 'roi', roi);
end
end


function [x2,df] = cca_single_node(Y, x)
    N          = size(Y,1);
    Z          = ones(N,1);
    Rz         = eye(N) - Z/(Z'*Z)*Z';
    XStar      = Rz * x;
    YStar      = Rz * Y;
    [p,r]      = deal(1, 1);   %nContrasts, nNuisanceFactors
    m          = N - p - r;
    H          = YStar' * XStar  / ( XStar' * XStar  )  * XStar' * YStar / p;
    W          = YStar'  * (eye(N)  -  XStar / (XStar'*XStar)*XStar') * YStar  / m;
    %estimate maximum canonical correlation:
    F          = W \ H;
    % ff         = eigvals(  F  )
    [~,ff]     = eigs(F);
    fmax       = real( max(ff(:)) );
    r2max      = fmax * p  / (m + fmax*p);
    rmax       = sqrt(r2max);
    %compute test statistic:
    m          = size(Y,2);
    x2         = -(N-1-0.5*(m+2)) * log(  (1-rmax^2) );
    %assemble:
    df      = [1 m]; 
end


function [R] = here_get_residuals(Y, x)
[J,Q,I]    = size(Y);
X          = [x(:) ones(J,1)];
Xi         = pinv(X);
R          = zeros(size(Y));
for i = 1:Q
    for ii = 1:I
        yy     = Y(:,i,ii);
        b      = Xi*yy;
        eij    = yy - X*b;
        R(:,i,ii) = eij';
    end
end
end





