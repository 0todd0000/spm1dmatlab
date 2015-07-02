function [FWHM] = fwhm(R)

% Copyright (C) 2015  Todd Pataky
% Version: M0.1 (2015/07/01)

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
