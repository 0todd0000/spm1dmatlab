function [Ys] = spm1d_smooth(Y, w)

% Copyright (C) 2014  Todd Pataky
% Version: M0.1 (2014/05/01)

[J,Q]   = size(Y);                  %number of curves/nodes
s       = w/sqrt(8*log(2)) + eps;   %st.dev. of Gaussian kernel
n       = min([ceil(3*s) Q]);       %kernel size
x       = -n:n;                     %kernel span
g       = exp(-x.^2/(2*s^2));       %Gaussian kernel
g       = g/sum(g);


%smooth all trajectories:
Ys      = zeros(J,Q);
for i = 1:J
    y       = Y(i,:);
    ys      = [fliplr(y(1:n)) y fliplr(y((1:n) + Q - n))];
    ys      = conv(ys, g);
    ys      = ys( (1:Q) + 2*n );
    Ys(i,:) = ys;
end


