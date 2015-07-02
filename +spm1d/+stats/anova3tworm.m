function [SPM] = anova3tworm(Y, A, B, C, SUBJ)

design = spm1d.stats.anova.designs.ANOVA3tworm(A, B, C, SUBJ);
[X,CC] = deal(design.X, design.contrasts);
solver = spm1d.stats.anova.solvers.Solver(Y, X);
SPM    = solver.compute_test_statistics(CC);



