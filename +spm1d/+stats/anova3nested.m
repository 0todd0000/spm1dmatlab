function [SPM] = anova3nested(Y, A, B, C)

design = spm1d.stats.anova.designs.ANOVA3nested(A, B, C);
[X,CC] = deal(design.X, design.contrasts);
solver = spm1d.stats.anova.solvers.SolverNested3(Y, X);
SPM    = solver.compute_test_statistics(CC);



