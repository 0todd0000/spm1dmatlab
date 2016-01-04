function [FWHM] = fwhm(R)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: fwhm.m 1 2016-01-04 16:07 todd $


ssq     = sum(R.^2, 1);
[dx,~]  = gradient(R);
v       = sum(dx.^2, 1);
% normalize:
v       = v ./ (ssq + eps);
% ignore zero-variance nodes:
i       = isnan(v);
v       = v(~i);
% global FWHM estimate:
rpn     = sqrt(v / (4*log(2)));  %resels per node
FWHM    = 1 / mean(rpn);
