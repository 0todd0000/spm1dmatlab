function [SPM] = anova1rm(Y, A, SUBJ)

design = spm1d.stats.anova.designs.ANOVA1rm(A, SUBJ);
[X,CC] = deal(design.X, design.contrasts);
solver = spm1d.stats.anova.solvers.Solver(Y, X);
SPM    = solver.compute_test_statistic(CC{1});





