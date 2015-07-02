function [SPM] = anova3(Y, A, B, C)

design = spm1d.stats.anova.designs.ANOVA3(A, B, C);
[X,CC] = deal(design.X, design.contrasts);
solver = spm1d.stats.anova.solvers.Solver(Y, X);
SPM    = solver.compute_test_statistics(CC);



