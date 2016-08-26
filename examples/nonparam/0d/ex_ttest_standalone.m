

clear;  clc


%(0) Create data:
y     = [0.4, 0.2, 0.5, 0.3, -0.1];
n     = numel(y);
alpha = 0.05;
sqrtN = n^0.5;


%(1) Compute original test statistic:
t0    = mean(y) / std(y) * sqrtN;


%(2) Conduct non-parametric test:
%%% create sign permutations:
signs = [-1 1];
nPerm = 2^n;
SIGNS = zeros(nPerm,n);
for i=1:n
    ss  = sort( repmat(signs, [1, 2^(i-1)]) );
    col = repmat(ss, [1, 2^(n-i)]);
    SIGNS(:,n-i+1) = col;
end
%%% build permutation PDF:
T     = zeros(nPerm, 1);
for i = 1:nPerm
    yy   = y .* SIGNS(i,:);
    T(i) = mean(yy) / std(yy) * sqrtN;
end
%%% conduct inference:
p      = mean( T > t0 );
tCrit  = prctile(T, 100*(1-alpha));


%(3) Compare to parametric inference:
spm    = spm1d.stats.ttest(y).inference(alpha, 'two_tailed',false);
tp     = spm.z;
pp     = spm.p;
tCritp = spm.zstar;
%%% results:
fprintf('Non-parametric results:\n')
fprintf('   t=%.5f, tCritical=%.5f, p=%.5f\n', t0,tCrit,p)
fprintf('Parametric test:\n')
fprintf('   t=%.5f, tCritical=%.5f, p=%.5f\n', tp,tCritp,pp)





















