


classdef Solver
   properties
        dim
        Y
        X
        J
        Q
        R
        beta
        rankR
        dfE
        SSE
        MSE
        eij
        fwhm
        resels
   end
   methods
       function self = Solver(Y, X)
           if isvector(Y)
               self.dim = 0;
           else
               self.dim = 1;
           end
           self.Y   = Y;
           self.X   = X;
           self.J   = size(X,1);
           self.Q   = size(Y,2);
           self = estimate_parameters(self);
       end
       
       function [SS,df] = compute_ss_from_matrix(self, C)
           [J,X,b,R] = deal(self.J, self.X, self.beta, self.R);
           X0 = self.get_design_matrix_reduced(C);
           R0 = eye(J) - X0*pinv(X0);
           M  = R0 - R;
           SS = diag( b' * X' * M * X * b ); %#ok<*PROP>
           df = self.matrixrank(M);
       end
       
       function [SS,df] = compute_ss(self, contrast)
           [SS,df] = self.compute_ss_from_matrix(contrast.C');
       end
       
       function [SPM] = compute_test_statistic(self, contrast)
           [SS,df] = self.compute_ss(contrast);
           MS = SS / df;
           F  = (MS ./ self.MSE)';
           df = [df self.dfE];
           SS = [SS self.SSE];
           MS = [MS self.MSE];
           if self.dim==0
               SPM = spm1d.stats.spm.SPM0DF(F, df, SS, MS);
           else
                SPM = spm1d.stats.spm.SPM('F', F, df, self.fwhm, self.resels);
           end
       end
       

        function [SPM] = compute_test_statistic_rm(self, contrast)
           [C,CE]    = contrast.get_compound_matrices();
           [SS0,df0] = self.compute_ss_from_matrix(C');
           [SSE,dfE] = self.compute_ss_from_matrix(CE');
           [SS,df]   = deal(SS0-SSE, df0-dfE);
           if df<0
               df    = contrast.n;
           end
           [MS,MSE]  = deal(SS/df, SSE/dfE);
           F         = MS/MSE;
           if self.dim==0
               SPM = spm1d.stats.spm.SPM0DF(F, [df dfE], [SS SSE], [MS MSE]);
           else
               SPM = spm1d.stats.spm.SPM('F', F, [df dfE], self.fwhm, self.resels);
           end

       end
       
        function [SPM] = compute_test_statistics(self, contrasts)
           n = numel(contrasts);
           SPM = cell(1,n);
           for i = 1:n
               if contrasts{i}.isrm
                   SPM{i} = self.compute_test_statistic_rm( contrasts{i} );
               else
                    SPM{i} = self.compute_test_statistic( contrasts{i} );
               end
           end
           SPM = spm1d.stats.spm.SPMList(SPM);
       end

       
       function X0 = get_design_matrix_reduced(self, C)
           C0 = eye(size(C,1)) - C*pinv(C);
           X0 = self.X * C0;
       end
       
       
       
   end
   
   methods (Access = private)
       function self = estimate_parameters(self)
            [Y,X,J]    = deal(self.Y, self.X, self.J);
            Xi         = pinv(X);
            self.beta  = Xi*Y;
            self.eij   = Y - X*self.beta;  %residuals
            self.R     = eye(J) - X*Xi;
            self.rankR = self.matrixrank(self.R);
            self.SSE   = diag(Y' * self.R * Y);
            self.dfE   = self.rankR;
            if self.dfE > eps
                self.MSE = self.SSE / self.dfE;
            end
            
            if self.dim==0
                self.fwhm = 0;
                self.resels = 0;
            else
                self.fwhm     = mean( spm1d.geom.fwhm(self.eij) );
                self.resels   = spm1d.geom.resels(self.eij, self.fwhm);
            end
       end
       
       
   end
   
   
   methods (Static)
        function [r] = matrixrank(A)
           S   = svd(A);
           tol = 10 * max(S) * max(size(A)) * eps;
           r   = sum(S>tol);
        end
   end
   
    
end