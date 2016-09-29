%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef CalculatorRegress
    properties
        J      %number of responses
        x      %independent variable
        df     %degrees of freedom
        X      %design matrix
        Xi     %design matrix inverse
        c      %contrast vector
        cXXc   %variance scaling factor
    end
    
    methods
        function [self] = CalculatorRegress(x)
            self.J      = numel(x);
            self.x      = x;
            self.df     = self.J - 2;
            %design matrix:
            self.X      = ones(self.J, 2);
            self.X(:,1) = self.x;
            self.Xi     = pinv( self.X );
            self.c      = [1 0]';
            self.cXXc   = self.c' * inv(self.X' * self.X) * self.c;
        end
        
        function [z] = get_test_stat(self, y)
            b      = self.Xi * y;
            eij    = y - self.X * b;
            R      = eij' * eij;
            sigma2 = diag(R) / self.df;
            z      = (self.c' * b)' ./ (sqrt(sigma2 * self.cXXc) + eps);
            z      = z';
        end
    end
    

end



