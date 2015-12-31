function [FWHM] = fwhmmv(R)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: fwhmmv.m 1 2016-01-04 16:07 todd $

nComp = size(R,3);
W     = 0;  
for i = 1:nComp
    r = R(:,:,i);
    fwhm     = mean( spm1d.geom.fwhm(r) );
    W = W + fwhm;
end
FWHM = W/nComp;
end