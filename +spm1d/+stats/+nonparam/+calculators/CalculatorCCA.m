%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef CalculatorCCA
    properties
        J      %number of responses
        I
        Q
        X      %independent variable
        Rz
        XXXiX
        p
        r
        m
    end
    
    methods
        function [self] = CalculatorCCA(x, I, Q)
            self.J      = numel(x);
            self.I      = I;
            self.Q      = Q;
            self.X      = x;
            Z           = ones(self.J, 1);
            self.Rz     = eye(self.J) - Z * inv(Z'*Z) * Z';
            Xstar       = self.Rz * self.X;
            self.XXXiX  = Xstar * inv(Xstar' * Xstar) * Xstar';
            self.p      = 1;
            self.r      = 1;
            self.m      = self.J - self.p - self.r;
        end

        function [z] = get_test_stat(self, y)
            if self.Q==1
                z   = self.get_test_stat_single_node(y);
            else
                z   = zeros(1, self.Q);
                for i = 1:self.Q
                    z(i) = self.get_test_stat_single_node( squeeze(y(:,i,:)) );
                end
            end
        end
        
        function [z] = get_test_stat_single_node(self, y)
            Ystar       = self.Rz * y;
            H           = Ystar' * self.XXXiX * Ystar / self.p;
            W           = Ystar' * (eye(self.J) - self.XXXiX) * Ystar / self.m;
            %estimate maximum canonical correlation:
            F           = W \ H;
            [~,ff]      = eigs(F);
            fmax        = real( max(ff(:)) );
            r2max       = fmax * self.p  / (self.m + fmax*self.p);
            rmax        = sqrt(r2max);
            %compute test statistic:
            z           = -(self.J-1-0.5*(self.I+2)) * log(  (1-rmax^2) );
        end
        
    end
    

end



