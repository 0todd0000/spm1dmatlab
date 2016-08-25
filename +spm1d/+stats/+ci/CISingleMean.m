%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM0D.m 1 2016-01-04 16:07 todd $


classdef CISingleMean < matlab.mixin.CustomDisplay  & spm1d.stats.ci.CIbase
    properties
        mean
        ci
        mu = 0;
    end
    methods
        function [self] = CISingleMean(spmi, mn, hstar, mu)
            self@spm1d.stats.ci.CIbase(spmi)
            %main attributes:
            self.kind            = 'One sample';
            self.nMeans          = 1;
            self.ismultimean     = false;
            self.mean            = mn;
            self.mu              = mu;
            %datum:
            self.datum_ci        = 'ci';
            self.datum_type      = 'mean';
            self.datum_value     = mn;
            %criterion:
            self.criterion_type  = 'mu';
            self.criterion_value = mu;
            %confidence interval:
            self.hstar           = hstar;
            self.ci              = [mn-hstar  mn+hstar];
            self = self.assemble_datum_criterion_pairs();
        end
    end
end

