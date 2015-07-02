function [SPM] = anova1(Y, A)

design = spm1d.stats.anova.designs.ANOVA1(A);
[X,CC] = deal(design.X, design.contrasts);
solver = spm1d.stats.anova.solvers.Solver(Y, X);
SPM    = solver.compute_test_statistic(CC{1});





