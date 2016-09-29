function [SPM] = manova1(Y, A, varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



parser = inputParser;
addOptional(parser, 'roi',       [], @(x)isempty(x) || ((islogical(x)|| isnumeric(x)) && isvector(x))   );
parser.parse(varargin{:});
roi          = parser.Results.roi;



% create design matrix:
J       = size(Y,1);
u       = unique(A);
nGroups = numel(u);
X       = zeros(J, nGroups);
for k=1:nGroups
    X(A==u(k),k) = 1;
end
% reduced design:
X0    = ones(J,1);

    

if ismatrix(Y)
    [J,I]  = size(Y);
    [p,k]  = deal(I, nGroups);
    df     = [1 p*(k-1)];
    x2     = here_manova1_single_node(Y, X, X0);
    SPM    = spm1d.stats.spm.SPM0D('X2', x2, df);
else
    [~,Q,I]    = size(Y);
    [X2,R]     = deal(zeros(1, Q), zeros(size(Y)));
    for q = 1:Q
        [X2(q),R(:,q,:)]  = here_manova1_single_node( squeeze(Y(:,q,:)), X, X0);
    end
    [p,k]  = deal(I, nGroups);
    df     = [1 p*(k-1)];
    fwhm   = spm1d.geom.fwhmmv(R);
    if isempty(roi)
        resels   = spm1d.geom.resels(R, fwhm);
    else
        B    = any(isnan(any(isnan(R), 1)), 3);
        B    = ~B & roi;
        resels   = spm1d.geom.resels(B, fwhm);
    end
    SPM    = spm1d.stats.spm.SPM('X2', X2, df, fwhm, resels, 'roi', roi);
end
end

function [x2,res] = here_manova1_single_node(Y, X, X0)
    [J,I]   = size(Y);
    nGroups = size(X,2);
    %SS for original design:
    b       = X \ Y;
    res     = Y - X*b;
    R       = res'*res;
    %SS for reduced design:
    b0      = X0 \ Y;
    R0      = Y - X0*b0;
    R0      = R0'*R0;
    %Wilk's lambda:
    lam     = det(R) / (det(R0) + eps);
    %test statistic:
    [N,p,k] = deal(J, I, nGroups);
    x2      = -((N-1) - 0.5*(p+k)) * log(lam);
end


