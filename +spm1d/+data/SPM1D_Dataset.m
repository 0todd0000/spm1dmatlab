%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM1D_Dataset.m 1 2016-01-04 16:07 todd $

classdef SPM1D_Dataset
    properties
        design
        www
        cite
        datafile
        STAT
        dim
        z
        df
        p
    end
    
    methods
        
        function [self] = SPM1D_Dataset(self)
            self.Y = 1;
        end
        
        function [self] = get_expected_results_as_string(self)
            a = 1;
        end
    end
       

    
end