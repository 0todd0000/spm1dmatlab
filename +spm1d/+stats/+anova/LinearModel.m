%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky




classdef LinearModel
   properties
        dim
        Y
        X
        J
        Q
        QT
        R
        beta
        rankR
        dfE
        SSE
        MSE
        eij
        fwhm
        resels
        roi
   end
   methods
       function self = LinearModel(Y, X, varargin)
           Y         = spm1d.util.flatten(Y); 
           if isvector(Y)
                self.dim = 0;
            else
                self.dim = 1;
            end
            %parse varargin for ROI:
            parser   = spm1d.stats.anova.parseargs(varargin{:});
            self.roi = parser.Results.roi;
            %assemble attributes:
            self.Y   = Y;
            self.X   = X;
            self.J   = size(X,1);
            self.Q   = size(Y,2);
       end
       

       
       function self = fit(self, varargin)
            if nargin==2
                approx_residuals = varargin{1};
            end
            [Y,X,J]    = deal(self.Y, self.X, self.J); %#ok<*PROPLC>
            Xi         = pinv(X);
            self.beta  = Xi*Y;
            
            self.R     = eye(J) - X*Xi;
            self.rankR = self.matrixrank(self.R);
            self.SSE   = diag(Y' * self.R * Y);
            self.dfE   = self.rankR;
            if self.dfE > eps
                self.MSE = self.SSE / self.dfE;
            end
            
            if nargin==1
                self.eij    = Y - X*self.beta;  %residuals
            else %approximate residuals based on a reduced design
                C           = approx_residuals;
                A           = X * C';
                b           = pinv(A) * Y;
                self.eij    = Y - A*b;
            end

            if self.dim==0
                self.fwhm = 0;
                self.resels = 0;
            else
                self.fwhm     = mean( spm1d.geom.fwhm(self.eij) );
                if isempty(self.roi)
                    self.resels   = spm1d.geom.resels(self.eij, self.fwhm);
                else
                    B    = any(isnan(self.eij), 1);
                    B    = ~B & self.roi;
                    self.resels   = spm1d.geom.resels(B, self.fwhm);
                end
            end
            
            [Q,~]    = qr(X, 0);
            self.QT  = Q';
       end
       
       function [SPM] = aov(self, contrasts, F_terms)
            effects = self.QT * self.Y;
            SS = contrasts.C * effects.^2;
            DF = sum(contrasts.C, 2);
            nTerms = numel(F_terms);
            SPM = cell(1,nTerms);
            for k = 1:nTerms
                [term0,term1] = deal(F_terms{k}{1}, F_terms{k}{2});
                i = find(ismember(contrasts.term_labels, term0));
                [ss0,df0] = deal(SS(i,:), DF(i));
                ms0 = ss0 / df0;
                if isequal(term1, 'Error')
                    [ss1,df1,ms1] = deal(self.SSE, self.dfE, self.MSE);
                else
                    i = find(ismember(contrasts.term_labels, term1));
                    [ss1,df1] = deal(SS(i,:), DF(i));
                    ms1 = ss1 / df1;
                end
                [ms0,ms1] = deal(ms0(:), ms1(:));
                f  = (ms0 ./ ms1)';
                df = [df0 df1];
                if self.dim==0
                    spm = spm1d.stats.spm.SPM0DF(f, df, [ss0 ss1], [ms0 ms1], self.eij);
                else
                    spm = spm1d.stats.spm.SPM_F(f, df, self.fwhm, self.resels, self.X, self.beta, self.eij, self.roi);
                    % spm = spm1d.stats.spm.SPM('F', f, df, self.fwhm, self.resels, 'roi', self.roi, 'residuals', self.eij);
                    % spm = spm1d.stats.spm.SPM_F(f, df, self.fwhm, self.resels, 'roi', self.roi, 'residuals', self.eij);
                    % z, df, fwhm, resels, X, beta, eij, X0
                end
                SPM{k} = spm;
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