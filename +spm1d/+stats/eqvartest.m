function [f,fcrit] = eqvartest(y0, y1, varargin)
%__________________________________________________________________________
% Copyright (C) 2021 Todd Pataky
%
%	F test for equal variance.
%	
%	This test was reported in Kowalski et al. (2021) and adapted from the
%	MATAB script provided as supplementary material with that article.
%	
%	NOTE: The current implementation of this test does not follow the
%   general spm1d.stats procedures. See details below.
%
%	References:
%	
%	F-test of equality of variances
%	https://en.wikipedia.org/wiki/F-test_of_equality_of_variances
%	
%	Kowalski, E., Catelli, D. S., & Lamontagne, M. (2021). A waveform test
%	for variance inequality, with a comparison of ground reaction force
%	during walking in younger vs. older adults. Journal of Biomechanics
%	127: 110657.
%	https://doi.org/10.1016/j.jbiomech.2021.110657
%
%	Inputs:
%	
%	- y0 --- (J0 x Q) numpy array (dependent variable, one group)
%	- y1 --- (J1 x Q) numpy array (dependent variable, one group)
%	- alt --- alternative hypothesis: "unequal" (default) or "greater" ( var(y0) > var(y1) )
%	- alpha --- Type I error rate (set this to 0 to bypass inference and return only the F statistic)
%	
%	Returns:
%	
%	- f --- (Q,) array containing the test statistic.
%	- fcrit --- random field theory-corrrected critical f value (NaN if alpha=0)

    spm1d.util.check_zero_var(y0);
    spm1d.util.check_zero_var(y1);

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
        fcrit = spm1d.rft1d.f.isf(pcrit, df, Q, efwhm);
    end

end


