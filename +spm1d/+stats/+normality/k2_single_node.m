function [k2] = k2_single_node(x)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: ttest.m 1 2016-01-04 16:07 todd $


n   = numel(x);
x   = sort(x);

%estimate skewness and kurtosis
[s1,s2,s3,s4]  = deal(sum(x), sum(x.^2), sum(x.^3), sum(x.^4));
SS   = s2 - (s1*s1 / n );
v    = SS / (n-1);
k3   = ( (n*s3) - (3*s1*s2) + ((2*(s1^3))/n)) / ((n-1)*(n-2));
g1   = k3 / (v^1.5);
k4   = (   (n+1) * ( (n*s4) - (4*s1*s3) + (6*(s1*s1)*(s2/n)) - ((3*(s1^4)) / (n*n))) / ( (n-1)*(n-2)*(n-3) )   )   -   ((3*(SS*SS)) / ((n-2)*(n-3)));
g2   = k4 / (v*v);
eg1  = ( (n-2) * g1 ) / ( n * (n-1) )^0.5;   %skewness
eg2  = ( (n-2) * (n-3) * g2 ) / ((n+1)*(n-1)) + ((3*(n-1))/(n+1));   %kurtosis

%transformed sample skewness:
A    = eg1 * (((n+1)*(n+3))/(6*(n-2)))^0.5;
B    = (3*((n*n)+(27*n)-70)*((n+1)*(n+3)))/((n-2)*(n+5)*(n+7)*(n+9));
C    = (2*(B-1))^0.5 - 1;
D    = C^0.5;
E    = 1/ log(D)^0.5;
F    = A / (2/(C-1))^0.5;
Zg1  = E* log( F + (F*F+1)^0.5 );   %transformed skewness

%transformed sample kurtosis:
G    = (24*n*(n-2)*(n-3))/((n+1)^2*(n+3)*(n+5));
H    = ((n-2)*(n-3)*g2)/((n+1)*(n-1)* G^0.5);
J    = ((6*(n*n-(5*n)+2))/((n+7)*(n+9))) * ((6*(n+3)*(n+5))/((n*(n-2)*(n-3))))^0.5;
K    = 6+((8/J)*((2/J) + (1+(4/(J*J)))^0.5   )   );
L    = (1-(2/K))/(1+H * (2/(K-4))^0.5   );
Zg2  = (1-(2/(9*K))-L^(1/3)) / (2/(9*K))^0.5;           %transformed kurtosis

%D'Agostino-Pearson test statistic:
k2   = Zg1^2 + Zg2^2;