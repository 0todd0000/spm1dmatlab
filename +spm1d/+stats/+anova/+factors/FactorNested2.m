%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky




classdef FactorNested2
    properties
        A
        NEST0
        NEST1
        J
        u
        n
        isnested    = true;
        balanced    = true;
        nested      = [];
    end
    
    methods
        function [self] = FactorNested2(A, NEST0, NEST1)
            self.A      = A;
            self.NEST0  = NEST0;
            self.NEST1  = NEST1;
            self.J      = numel(A);
            self.u      = {};
            self.n      = [];
            %%% parse:
            [A,B,C]     = deal(NEST0.A, NEST1.A, self.A);
            [uA,UB]     = deal(NEST0.u, NEST1.u);
            for i = 1:numel(uA)
                uuA     = uA(i);
                [u,n]   = deal({},[]);
                for ii = 1:numel(UB{i})
                    uuB = UB{i}(ii);
                    uu  = unique( C( (A==uuA) & (B==uuB) )  );
                    u   = [u uu];
                    n   = [n numel(uu)];
                end
                self.u  = [self.u; u]; %#ok<*AGROW>
                self.n  = [self.n; n];
            end
            
        end
        
        

                
        function X = get_design_main(self)
           [A,B,C]     = deal(self.NEST0.A, self.NEST1.A, self.A); %#ok<*PROP,*ASGLU>
           [uA,UB,UUC] = deal(self.NEST0.u, self.NEST1.u, self.u);
           [nA,NB,NNC] = deal(self.NEST0.n, self.NEST1.n, self.n);
           X   = [];
           for k = 1:nA
               [uuA,uB,UC] = deal(uA(k), UB{k}, UUC(k,:));
               [nB,NC] = deal(NB(k), NNC(k,:));
               for kk = 1:nB
                    [uuB,uC] = deal(uB(kk), UC{kk});
                    nC = NC(kk);
                    for kkk = 1:nC-1
                        uuC = uC(kkk+1);
                        
                        x = zeros(self.J,1);
                        x((A==uuA)&(B==uuB)&(C==uuC)) = 1;
                        X = [X x];
                    end
               end
           end
       end

       
   end
    
end