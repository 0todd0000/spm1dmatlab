function [] = check_zero_var(y)
%__________________________________________________________________________
% Copyright (C) 2022 Todd Pataky
% Check for zero-variance nodes and raise and error if found


if ndims(y)==3
	n = size(y,3);
	for i = 1:n
		spm1d.util.check_zero_var( y(:,:,i) );
	end
	return
else
	b = std(y, 1) ==0;
end

if any(b)
	ind = find(b);
	msg = ['\n\n\n' ...
		'--- spm1d ZERO VARIANCE ERROR ---\n' ...
		'Zero variance detected at the following nodes:\n' ...
		'    %s\n' ...
		'Remove all zero-variance nodes before running tests.\n\n\n'];
	error(msg, num2str(ind))
end

