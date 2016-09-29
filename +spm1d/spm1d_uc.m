function [u] = spm1d_uc(a,df,STAT,R,n,S)
% interface to spm_uc from spm8 for Hotelling's T2 statistic
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



if STAT=='T2'
    [p,m] = deal(df(1), df(2));
    dfF   = [p, m-p+1];
    fstar = spm_uc(a, dfF, 'F', R, n, S);
    u     = fstar / ( dfF(2)/(p*m) );
else
    u     = spm_uc(a, df, STAT, R, n, S);
end
