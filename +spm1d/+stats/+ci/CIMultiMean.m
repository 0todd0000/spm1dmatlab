%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



classdef CIMultiMean < spm1d.stats.ci.CIbase
    properties
        meanA
        meanB
        ciA
        ciB
        cv
    end
    methods
        function [self]  = CIMultiMean(spmi, mA, mB, hstar, criterion)
            self@spm1d.stats.ci.CIbase(spmi)
            %main attributes:
            self.kind            = 'Multi mean';
            self.nMeans          = 2;
            self.ismultimean     = true;
            self.meanA           = mA;
            self.meanB           = mB;
            %datum:
            self.datum_ci        = 'ciA';
            self.datum_type      = 'meanA';
            self.datum_value     = self.meanA;
            %criterion and confidence interval:
            if isequal(criterion, 'meanB')
                self.ciA         = [mA-hstar  mA+hstar];
                self.cv          = mB;
            elseif isequal(criterion, 'tailB')
                self.ciA         = [mA-0.5*hstar  mA+0.5*hstar];
                self.ciB         = [mB-0.5*hstar  mB+0.5*hstar];
                if mA > mB
                    self.cv      = self.ciB(2);
                else
                    self.cv      = self.ciB(1);
                end
            end
            self.hstar           = hstar;
            self.criterion_type  = criterion;
            self.criterion_value = self.cv;
            self                 = self.assemble_datum_criterion_pairs();
        end
    end
    
end

