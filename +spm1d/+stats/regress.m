function [SPM] = regress(Y, x, varargin)
% Simple linear regression (test statistic computation only)
% 
% FORMATS
% [spm] = spm1d.stats.regress(y, x)
% [spm] = spm1d.stats.regress(y, x, roi)
% [spm] = spm1d.stats.regress(y, x, 'roi', roi)
%
% y     - (J x Q) data array
%         J - number of responses
%         Q - number of continuum nodes
% x     - (J x 1) array {independent variable}
% roi   - (1 x Q) region of interest {1D data only}
%
% spm   - statistical parametric map object
%__________________________________________________________________________
% Copyright (C) 2017 Todd Pataky


Y             = spm1d.util.flatten(Y);
[J,~]         = size(Y);
X             = ones(J, 2);
X(:,1)        = x;
c             = [1 0]';
[SPM]         = spm1d.stats.glm(Y, X, c, varargin{:});
SPM.r         = SPM.z ./ (  (J - 2 + SPM.z.^2).^0.5);  %t = r * ((J-2)/(1-r*r) )**0.5
SPM.isregress = true;

