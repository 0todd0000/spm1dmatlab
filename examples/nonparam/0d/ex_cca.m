

clear;  clc


%(0) Load dataset:
dataset  = spm1d.data.mv0d.cca.FitnessClub();
% dataset  = spm1d.data.mv0d.cca.StackExchange();
[y,x]  = deal(dataset.Y, dataset.x);



%(1) Conduct non-parametric test:
rng(0)
alpha      = 0.05;
snpm       = spm1d.stats.nonparam.cca(y, x);
snpmi      = snpm.inference(alpha, 'iterations', 1000);
disp('Non-parametric results')
disp( snpmi )



%(2) Compare to parametric inference:
spm        = spm1d.stats.cca(y, x);
spmi       = spm.inference(alpha);
disp('Parametric results')
disp( spmi )
