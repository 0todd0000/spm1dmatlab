

clear;  clc


%(0) Create data:
y        = [0.4, 0.2, 0.5, 0.3, -0.1];   %dataset
n        = numel(y);                     %sample size
alpha    = 0.05;                         %Type I error rate



%(1) Compute original test statistic:
t0       = mean(y) / std(y) * sqrt(n);



%(2) Conduct non-parametric test:
%%% create sign permutations:
signs    = [-1 1];
nPerm    = 2^n;
SIGNS    = zeros(nPerm,n);  %array of -1 and +1 values in all permutations
for i=1:n
    ss   = sort( repmat(signs, [1, 2^(i-1)]) );
    col  = repmat(ss, [1, 2^(n-i)]);
    SIGNS(:,n-i+1) = col;
end
%%% build permutation PDF:
T        = zeros(nPerm, 1);    %test statistic distribution
for i = 1:nPerm
    yy   = y .* SIGNS(i,:);    %sign-permuted data
    T(i) = mean(yy) / std(yy) * sqrt(n);  %t statistic for this permutation
end
%%% conduct inference:
p        = mean( T > t0 );     %proportion of permutations yielding t values greater than the original t value
tCrit    = prctile(T, 100*(1-alpha));  %critical t value for a Type I error rate of alpha



%(3) Compare to parametric inference:
spmi   = spm1d.stats.ttest(y).inference(alpha, 'two_tailed',false);
fprintf('Standalone non-parametric results:\n')
fprintf('   t=%.5f, tCritical=%.5f, p=%.5f\n', t0,tCrit,p)
fprintf(' Parametric results (from spm1d.stats.ttest):\n')
fprintf('   t=%.5f, tCritical=%.5f, p=%.5f\n', spmi.z, spmi.zstar, spmi.p)





















