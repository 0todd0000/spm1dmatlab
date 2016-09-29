function [snpm] = build_snpm(STAT, permuter)

%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky



z          = permuter.get_test_stat_original();
dim        = permuter.dim;
nz         = permuter.nEffects;


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
                snpm  = spm1d.stats.nonparam.snpm.SnPM1D_F(z, permuter);
            end
            

        else  %multiple F statistics
            SnPMs = cell(1, nz);
            for i = 1:nz
                if dim==0
                    SnPMs{i}  = spm1d.stats.nonparam.snpm.SnPM0D_F(z(i), permuter);
                else
                    SnPMs{i}  = spm1d.stats.nonparam.snpm.SnPM1D_F(z(:,i)', permuter);
                end
            end
            if dim==0
                snpm  = spm1d.stats.nonparam.snpm.SnPM0D_FList(SnPMs, permuter);
            else
                snpm  = spm1d.stats.nonparam.snpm.SnPM1D_FList(SnPMs, permuter);
            end
            snpm  = spm1d.stats.anova.set_labels(snpm, permuter.calc.design);
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


