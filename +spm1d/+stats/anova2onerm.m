function [SPM] = anova2onerm(Y, A, B, SUBJ)

design = spm1d.stats.anova.designs.ANOVA2onerm(A, B, SUBJ);
[X,CC] = deal(design.X, design.contrasts);
solver = spm1d.stats.anova.solvers.Solver(Y, X);
SPM    = solver.compute_test_statistics(CC);


