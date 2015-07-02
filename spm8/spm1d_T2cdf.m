function [P] = spm1d_T2cdf(u, df)
% Cumulative Distribution Function (CDF) of Hotelling's T2 distribution

% Copyright (C) 2015  Todd Pataky
% (2015/06/17)

[p,m] = deal(df(1), df(2));
dfF   = [p, m-p+1];
F     = u * ( dfF(2)/(p*m) );
P     = spm_Fcdf(F, dfF);


