%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef CalculatorMANOVA1
    properties
        n1pk
        X
        Xi
        X0
        X0i
        Q
    end
    
    methods
        function [self] = CalculatorMANOVA1(A, I, Q)
            self.Q    = Q;
            J         = numel(A);
            u         = unique(A);
            nGroups   = numel(u);
            self.n1pk = - ((J-1) - 0.5 * (I+nGroups) );
            %design matrix:
            self.X    = zeros(J, nGroups);
            for i=1:nGroups
                self.X(A==u(i),i) = 1;
            end
            self.Xi   = pinv(self.X);
            %reduced design matrix:
            self.X0   = ones(J, 1);
            self.X0i  = pinv( self.X0 );
        end
        
        function [z] = get_test_stat(self, y)
            if self.Q==1
                z    = self.get_test_stat_single_node( y );
            else
                z       = zeros(1, self.Q);
                for i = 1:self.Q
                    z(i) = self.get_test_stat_single_node( squeeze( y(:,i,:) ) );
                end
            end
        end

        function [z] = get_test_stat_single_node(self, y)
            %SS for original design:
            b       = self.Xi * y;
            R       = y - self.X * b;
            R       = R'*R;
            %SS for reduced design:
            b0      = self.X0i * y;
            R0      = y - self.X0 * b0;
            R0      = R0'*R0;
            %Wilk's lambda:
            lam     = det(R) / (det(R0) + eps);
            z       = self.n1pk * log(lam);
        end

    end
end



