function [FWHM] = fwhmmv(R)
nComp = size(R,3);
W     = 0;  
for i = 1:nComp
    r = R(:,:,i);
    fwhm     = mean( spm1d.geom.fwhm(r) );
    W = W + fwhm;
end
FWHM = W/nComp;
end