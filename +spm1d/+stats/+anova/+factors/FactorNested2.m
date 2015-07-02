


classdef FactorNested2
    properties
        A
        NEST0
        NEST1
        J
        u
        n
        pairs
        nPairs
        isnested    = true;
        isrm        = false;
        isbalanced  = true;
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
            self.pairs  = {};
            self.nPairs = [];
            %%% parse:
            [A,B,C]     = deal(NEST0.A, NEST1.A, self.A);
            [uA,UB]     = deal(NEST0.u, NEST1.u);
            for i = 1:numel(uA)
                uuA     = uA(i);
                [u,n]   = deal({},[]);
                [p,np]  = deal({},[]);
                for ii = 1:numel(UB{i})
                    uuB = UB{i}(ii);
                    uu  = unique( C( (A==uuA) & (B==uuB) )  );
                    u   = [u uu];
                    n   = [n numel(u)];
                    pp  = [uu(1:end-1) uu(2:end)];
                    p   = [p pp];
                    np  = [np size(pp,1)];
                end
                self.u  = [self.u; u]; %#ok<*AGROW>
                self.n  = [self.n; n];
                self.pairs = [self.pairs; p];
                self.nPairs = [self.nPairs; np];
            end
        end
       
        function X = get_design_main(self)
           [A,B,C]     = deal(self.NEST0.A, self.NEST1.A, self.A); %#ok<*PROP,*ASGLU>
           X   = [];
           for i = 1:self.NEST0.n
                [uA,UB,PAIRSC] = deal(self.NEST0.u(i), self.NEST1.u{i}, self.pairs(i,:));
                for ii = 1:numel(UB)
                    [uB,pairsC] = deal(UB(ii), PAIRSC{ii});
                    for iii = 1:size(pairsC,1)
                        [u0,u1] = deal(pairsC(iii,1), pairsC(iii,2));
                           x = zeros(self.J,1);
                           x((A==uA)&(B==uB)&(C==u0)) = 1;
                           x((A==uA)&(B==uB)&(C==u1)) = -1;
                           X = [X x];
                    end
               end
           end
       end

       
   end
    
end