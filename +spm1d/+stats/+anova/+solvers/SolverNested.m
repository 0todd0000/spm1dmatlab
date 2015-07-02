


classdef SolverNested < spm1d.stats.anova.solvers.Solver
    methods
        function self = SolverNested(Y, X)
            self@spm1d.stats.anova.solvers.Solver(Y, X)
        end
        function [SPM] = compute_test_statistics(self, contrasts)
            [SSA,dfA] = self.compute_ss(contrasts{1});
            [SSB,dfB] = self.compute_ss(contrasts{2});
            [MSA,MSB] = deal(SSA/dfA, SSB/dfB);
            [fA,fB]   = deal(MSA/MSB, MSB/self.MSE);
            if self.dim==0
               SPMA   = spm1d.stats.spm.SPM0DF(fA, [dfA dfB], [SSA SSB], [MSA MSB]);
               SPMB   = spm1d.stats.spm.SPM0DF(fB, [dfB self.dfE], [SSB self.SSE], [MSB self.MSE]);
            end
            SPM = spm1d.stats.spm.SPMList({SPMA SPMB});
        end
    end
end