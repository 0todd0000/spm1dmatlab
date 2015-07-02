function [SPM] = anova2rm(Y, A, B, SUBJ)

design = spm1d.stats.anova.designs.ANOVA2rm(A, B, SUBJ);
[X,CC] = deal(design.X, design.contrasts);
solver = spm1d.stats.anova.solvers.Solver(Y, X);
SPM    = solver.compute_test_statistics(CC);


