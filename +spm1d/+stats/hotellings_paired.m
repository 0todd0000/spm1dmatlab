function [SPM] = hotellings_paired(YA, YB, varargin)
% Paired Hotelling's T2 test (test statistic computation only)
% 
% FORMATS
% [spm] = spm1d.stats.hotellings_paired(yA, yB)
% [spm] = spm1d.stats.hotellings_paired(yA, yB, roi)
% [spm] = spm1d.stats.hotellings_paired(yA, yB, 'roi', roi)
%
% yA    - (J x Q x I) data array
%         J - number of responses
%         Q - number of continuum nodes
%         I - number of vector components
% yB    - (J x Q x I) data array
% roi   - (1 x Q) region of interest {1D data only}
%
% spm   - statistical parametric map object
%
% NOTES
% - A paired T2 test is equivalent to a one-sample T2 test on the paired
% differences, so the following two commands are equivalent:
%    [spm] = spm1d.stats.hotellings_paired(yA, yB)
%    [spm] = spm1d.stats.hotellings( yA - yB )
%__________________________________________________________________________
% Copyright (C) 2017 Todd Pataky



SPM = spm1d.stats.hotellings(YB-YA, varargin{:});


