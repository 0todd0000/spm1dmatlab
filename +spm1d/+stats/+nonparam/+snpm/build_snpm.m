function [snpm] = build_snpm(STAT, permuter)

%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: SPM.m 2 2016-03-30 17:01 todd $


z          = permuter.get_test_stat_original();
dim        = permuter.dim;
nz         = size(z,2);


switch STAT
    case 'T'
        if dim==0
            snpm  = spm1d.stats.nonparam.snpm.SnPM0D_T(z, permuter);
        else
            snpm  = spm1d.stats.nonparam.snpm.SnPM1D_T(z, permuter);
        end

    case 'F'
        if nz == 1
            if dim==0
                snpm  = spm1d.stats.nonparam.snpm.SnPM0D_F(z, permuter);
            elseif dim==1
                snpm  = spm1d.stats.nonparam.snpm.SnPM_F(z, permuter);
            end

        else  %multiple F statistics
            SnPMs = cell(1, nz);
            for i = 1:nz
                SnPMs{i}  = spm1d.stats.nonparam.snpm.SnPM0D_F(z(i), permuter);
            end
            if dim==0
                snpm  = spm1d.stats.nonparam.snpm.ASnPMFList(SnPMs, permuter);
                snpm  = spm1d.stats.anova.set_labels(snpm, permuter.calc.design);
            end
        end



    case 'T2'
        if dim==0
            snpm  = spm1d.stats.nonparam.snpm.SnPM0D_T2(z, permuter);
        else
            snpm  = spm1d.stats.nonparam.snpm.SnPM1D_T2(z, permuter);
        end
    case 'X2'
        if dim==0
            snpm  = spm1d.stats.nonparam.snpm.SnPM0D_X2(z, permuter);
        else
            snpm  = spm1d.stats.nonparam.snpm.SnPM1D_X2(z, permuter);
        end
end


