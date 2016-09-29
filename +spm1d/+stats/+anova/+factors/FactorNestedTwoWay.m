%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky




classdef FactorNestedTwoWay
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
        function [self] = FactorNestedTwoWay(A, NEST0, NEST1)
            self.A      = A;
            self.NEST0  = NEST0;
            self.NEST1  = NEST1;
            self.J      = numel(A);
            self.u      = {};
            self.n      = [];
            %%% parse:
            [A,B,S]     = deal(NEST0.A, NEST1.A, self.A);
            [uA,uB]     = deal(NEST0.u, NEST1.u);
            for i = 1:numel(uA)
                uuA     = uA(i);
                [u,n]   = deal({},[]);
                for ii = 1:numel(uB)
                    uuB = uB(ii);
                    uu  = unique( S( (A==uuA) & (B==uuB) )  );
                    u   = [u uu];
                    n   = [n numel(uu)];
                end
                self.u  = [self.u; u]; %#ok<*AGROW>
                self.n  = [self.n; n];
            end
            
        end
        
        
        function [balanced] = check_balanced_rm(self, other)
            [S,A] = deal(self.A, other.A);
            [uA,nA] = deal(other.u, other.n);
            balanced = true;
            N = -1;
            for k=1:nA
                uuA = uA(k);
                uS = unique( S(A==uuA) );
                for kk = 1:numel(uS)
                    uuS = uS(kk);
                    n = sum(  (A==uuA) & (S==uuS)  );
                    if N==-1
                        N = n;
                    else
                        balanced = n==N;
                    end
                end
            end
        end
        
        
                
        function X = get_design_main(self)
           [A,B,S]     = deal(self.NEST0.A, self.NEST1.A, self.A); %#ok<*PROP,*ASGLU>
           [uA,uB]     = deal(self.NEST0.u, self.NEST1.u);
           [nA,nB]     = deal(self.NEST0.n, self.NEST1.n);
           X   = [];
           for k = 1:nA
               uuA = uA(k);
               for kk = 1:nB
                   uuB = uB(kk);
                   uS = unique( S( (A==uuA) & (B==uuB) ) );
                   for kkk = 1:numel(uS)-1
                        uuS = uS(kkk+1);
                        x = zeros(self.J,1);
                        x((A==uuA)&(B==uuB)&(S==uuS)) = 1;
                        X = [X x];
                    end
               end
           end
        end


        function X = get_design_interaction(self, other)
           [A,B,C,S]     = deal(self.NEST0.A, self.NEST1.A, other.A, self.A); %#ok<*PROP,*ASGLU>
           [uA,uB,uC]    = deal(self.NEST0.u, self.NEST1.u, other.u);
           [nA,nB,nC]    = deal(self.NEST0.n, self.NEST1.n, other.n);
           X   = [];
           for k = 1:nA
               uuA = uA(k);
               for kk = 1:nB-1
                   uuB = uB(kk+1);
                   for kkk = 1:nC
                       uuC = uC(kkk);
                       uS = unique( S( (A==uuA) & (B==uuB) & (C==uuC) ) );
                       for kkkk = 1:numel(uS)-1
                            uuS = uS(kkkk+1);
                            x = zeros(self.J,1);
                            x((A==uuA)&(B==uuB)&(C==uuC)&(S==uuS)) = 1;
                            X = [X x];
                       end
                    end
               end
           end
       end

        
        
        
        
   end
    
end