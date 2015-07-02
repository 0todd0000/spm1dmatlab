function [SPM] = regress(Y, x)

% Copyright (C) 2014  Todd Pataky
% Version: M0.1 (2014/05/01)

[J,~]         = size(Y);
X             = ones(J, 2);
X(:,1)        = x;
c             = [1 0]';
[SPM]         = spm1d.stats.glm(Y, X, c);
SPM.r         = SPM.z ./ (  (J - 2 + SPM.z.^2).^0.5);  %t = r * ((J-2)/(1-r*r) )**0.5
SPM.isregress = true;

