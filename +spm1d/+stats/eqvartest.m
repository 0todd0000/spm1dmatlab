function [f,fcrit] = ttest(y0, y1, varargin)
%__________________________________________________________________________
% Copyright (C) 2021 Todd Pataky

    % parse input arguments:
    parser = inputParser;
    addOptional(parser, 'alt', 'unequal', @(x)ischar(x) && ismember( upper(x), {'UNEQUAL','GREATER'}  ) );
    addOptional(parser, 'alpha', 0.05,    @(x)isnumeric(x) && isscalar(x) && (x>=0) && (x<1) );
    parser.parse(varargin{:});
    alt    = parser.Results.alt;
    alpha  = parser.Results.alpha;

    % additional error checks:
    if (ndims(y0)<2) || (ndims(y1)<2)
        error( 'Only implemented for 1D data.' );
    end
    [J0,J1] = deal( size(y0,1) , size(y1,1) );
    if (J0~=J1) && strcmpi( alt, 'UNEQUAL' )
        error( 'Unequal alternative implemented only for equal sample sizes. Set "alt" to "greater" to conduct this test.' );
    end

    % calculate f statistic
    s0   = var(y0,[],1);
    s1   = var(y1,[],1);
    if strcmpi( alt, 'UNEQUAL' )
        ss   = [s0; s1];
        smax = max(ss, [], 1);
        smin = min(ss, [], 1);
        f    = smax ./ smin;
    else
        f    = s0 ./ s1; 
    end

    % inference:
    if alpha==0
        fcrit = nan;
    else
        Q     = size(y0, 2);
        df    = [J0-1, J1-1];
        r0    = y0 - mean(y0, 1);
        r1    = y1 - mean(y1, 1);
        r     = [r0; r1];
        efwhm = spm1d.geom.fwhm( r );
        if strcmpi( alt, 'UNEQUAL' )
            pcrit = alpha/2;
        else
            pcrit = alpha;
        end
        [pcrit,efwhm]
        fcrit = spm1d.rft1d.f.isf(pcrit, df, Q, efwhm);
    end

end


