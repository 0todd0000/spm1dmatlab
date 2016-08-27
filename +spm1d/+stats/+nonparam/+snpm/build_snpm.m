function [snpm] = build_snpm(STAT, permuter)

%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM.m 2 2016-03-30 17:01 todd $


z          = permuter.get_test_stat_original();
dim        = permuter.dim;

switch STAT
    case 'T'
        if dim==0
            snpm  = spm1d.stats.nonparam.snpm.SnPM0D_T(z, permuter);
        end
    case 'F'
        if dim==0
            snpm  = spm1d.stats.nonparam.snpm.SnPM0D_F(z, permuter);
        end
    case 'T2'
        if dim==0
            snpm  = spm1d.stats.nonparam.snpm.SnPM0D_T2(z, permuter);
        end
    case 'X2'
        if dim==0
            snpm  = spm1d.stats.nonparam.snpm.SnPM0D_X2(z, permuter);
        end
end


