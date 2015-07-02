function [SPM] = anova2(Y, A, B)

design = spm1d.stats.anova.designs.ANOVA2(A, B);
[X,CC] = deal(design.X, design.contrasts);
solver = spm1d.stats.anova.solvers.Solver(Y, X);
SPM    = solver.compute_test_statistics(CC);



