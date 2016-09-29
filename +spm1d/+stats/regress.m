function [SPM] = regress(Y, x, varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky


Y             = spm1d.util.flatten(Y);
[J,~]         = size(Y);
X             = ones(J, 2);
X(:,1)        = x;
c             = [1 0]';
[SPM]         = spm1d.stats.glm(Y, X, c, varargin{:});
SPM.r         = SPM.z ./ (  (J - 2 + SPM.z.^2).^0.5);  %t = r * ((J-2)/(1-r*r) )**0.5
SPM.isregress = true;

