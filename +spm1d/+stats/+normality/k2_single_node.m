function [k2] = k2_single_node(x)
%{
Copyright (C) 2016 Todd Pataky

Compute the D'Agostino-Pearson K2 test statistic at a single node.

This code is modified from "DagosPtest.m" by Antonio Trujillo-Ortiz available at:
https://mathworks.com/matlabcentral/fileexchange/3954-dagosptest/content/DagosPtest.m
and is based on the methods described in the paper below:

D'Agostino, Ralph B.; Albert Belanger; Ralph B. D'Agostino, Jr (1990)
"A suggestion for using powerful and informative tests of normality"
The American Statistician 44(4): 316-321.  doi:10.2307/2684359

See also:
https://en.wikipedia.org/wiki/D%27Agostino%27s_K-squared_test

"DagosPtest.m" authors:

A. Trujillo-Ortiz and R. Hernandez-Walls
Facultad de Ciencias Marinas
Universidad Autonoma de Baja California
Apdo. Postal 453
Ensenada, Baja California
Mexico.
atrujo@uabc.mx


------------ LICENSE -------------------------------------------

Copyright (c) 2015, Antonio Trujillo-Ortiz
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:

    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in
      the documentation and/or other materials provided with the distribution

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.
%}


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