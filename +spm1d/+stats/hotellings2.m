function [SPM] = hotellings2(YA, YB, varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



parser = inputParser;
addOptional(parser, 'roi',       [], @(x)isempty(x) || ((islogical(x)|| isnumeric(x)) && isvector(x))   );
parser.parse(varargin{:});
roi          = parser.Results.roi;


if ismatrix(YA)
    [JA,I]  = size(YA);
    [JB,~]  = size(YB);
    T2      = here_hotellings2_single_node(YA, YB);
    df      = [I JA+JB-2]; 
    SPM     = spm1d.stats.spm.SPM0D('T2', T2, df);
else
    [JA,Q,I] = size(YA);
    [JB,~,~] = size(YB);
    T2      = zeros(1, Q);
    for q = 1:Q
        T2(q) = here_hotellings2_single_node( squeeze(YA(:,q,:)), squeeze(YB(:,q,:)) );
    end
    df      = [I JA+JB-2]; 
    R       = here_get_residuals(YA, YB);
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



function [T2] = here_hotellings2_single_node(YA, YB)
    JA      = size(YA,1);
    JB      = size(YB,1);
    [mA,mB] = deal(mean(YA), mean(YB));
    [WA,WB] = deal(cov(YA), cov(YB));
    W       = ((JA-1)*WA + (JB-1)*WB) / (JA+JB-2);
    m       = mB-mA;
    T2      = (JA*JB)/(JA+JB)  * m * (W\m');
end


function [R] = here_get_residuals(YA, YB)
[JA,JB]    = deal(size(YA,1), size(YB,1));
[mA,mB]    = deal(mean(YA,1), mean(YB,1));
[RA,RB]    = deal(YA - repmat(mA, [JA 1 1]),   YB - repmat(mB, [JB 1 1]) );
R          = [RA; RB];
end


