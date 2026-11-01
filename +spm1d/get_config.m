function [config] = get_config()
%GET_CONFIG  return versions and platform for a bug report.
%
%   Example:
%
%       >> spm1d.get_config()
%       spm1d     M.0.4.53
%       matlab    24.2.0.2712019 (R2024b)
%       platform  MACA64
%
%__________________________________________________________________________
% Copyright (C) 2026  Todd Pataky


config          = struct();
config.spm1d    = spm1d.version();
config.matlab   = version();
config.platform = computer();

if nargout == 0
	names = fieldnames(config);
	n     = max( cellfun(@length, names) );
	for i = 1:numel(names)
		fprintf('%-*s  %s\n', n, names{i}, config.(names{i}));
	end
	clear config
end
