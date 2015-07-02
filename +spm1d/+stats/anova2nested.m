function [SPM] = anova2nested(Y, A, B)

design = spm1d.stats.anova.designs.ANOVA2nested(A, B);
[X,CC] = deal(design.X, design.contrasts);
solver = spm1d.stats.anova.solvers.SolverNested(Y, X);
SPM    = solver.compute_test_statistics(CC);


% design = spm1d.stats.anova.designs.ANOVA2nested(A, B);
% 
% 
% [X,CC] = deal(design.X, design.contrasts);
% solver = spm1d.stats.anova.solvers.SolverNested(Y, X);
% SPM    = solver.compute_test_statistics(CC);
