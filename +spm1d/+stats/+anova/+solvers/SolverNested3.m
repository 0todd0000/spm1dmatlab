


classdef SolverNested3 < spm1d.stats.anova.solvers.Solver
    methods
        function self = SolverNested3(Y, X)
            self@spm1d.stats.anova.solvers.Solver(Y, X)
        end
        function [SPM]    = compute_test_statistics(self, contrasts)
            [SSA,dfA]     = self.compute_ss(contrasts{1});
            [SSB,dfB]     = self.compute_ss(contrasts{2});
            [SSC,dfC]     = self.compute_ss(contrasts{3});
            [MSA,MSB,MSC] = deal(SSA/dfA, SSB/dfB, SSC/dfC);
            [fA,fB,fC]    = deal(MSA/MSB, MSB/MSC, MSC/self.MSE);
            if self.dim==0
               SPMA   = spm1d.stats.spm.SPM0DF(fA, [dfA dfB], [SSA SSB], [MSA MSB]);
               SPMB   = spm1d.stats.spm.SPM0DF(fB, [dfB dfC], [SSB SSC], [MSB MSC]);
               SPMC   = spm1d.stats.spm.SPM0DF(fC, [dfC self.dfE], [SSC self.SSE], [MSC self.MSE]);
            end
            SPM = spm1d.stats.spm.SPMList({SPMA SPMB, SPMC});
        end
    end
end