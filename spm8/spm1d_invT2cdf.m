function [T2star] = spm1d_invT2cdf(alpha, df)
% Inverse cumulative distribution function (CDF) of Hotelling's T2
% distribution

% Copyright (C) 2015  Todd Pataky
% (2015/06/17)


[p,m] = deal(df(1), df(2));
dfF   = [p, m-p+1];
fstar = spm_invFcdf(alpha, dfF);
T2star = fstar / ( dfF(2)/(p*m) );



